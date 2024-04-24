; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40434 () Bool)

(assert start!40434)

(declare-fun b!445033 () Bool)

(declare-fun e!261637 () Bool)

(declare-fun tp_is_empty!11833 () Bool)

(assert (=> b!445033 (= e!261637 tp_is_empty!11833)))

(declare-fun res!264032 () Bool)

(declare-fun e!261642 () Bool)

(assert (=> start!40434 (=> (not res!264032) (not e!261642))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27480 0))(
  ( (array!27481 (arr!13187 (Array (_ BitVec 32) (_ BitVec 64))) (size!13539 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27480)

(assert (=> start!40434 (= res!264032 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13539 _keys!709))))))

(assert (=> start!40434 e!261642))

(assert (=> start!40434 true))

(declare-datatypes ((V!16883 0))(
  ( (V!16884 (val!5961 Int)) )
))
(declare-datatypes ((ValueCell!5573 0))(
  ( (ValueCellFull!5573 (v!8213 V!16883)) (EmptyCell!5573) )
))
(declare-datatypes ((array!27482 0))(
  ( (array!27483 (arr!13188 (Array (_ BitVec 32) ValueCell!5573)) (size!13540 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27482)

(declare-fun e!261641 () Bool)

(declare-fun array_inv!9640 (array!27482) Bool)

(assert (=> start!40434 (and (array_inv!9640 _values!549) e!261641)))

(declare-fun array_inv!9641 (array!27480) Bool)

(assert (=> start!40434 (array_inv!9641 _keys!709)))

(declare-fun b!445034 () Bool)

(declare-fun res!264034 () Bool)

(assert (=> b!445034 (=> (not res!264034) (not e!261642))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27480 (_ BitVec 32)) Bool)

(assert (=> b!445034 (= res!264034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!445035 () Bool)

(declare-fun res!264035 () Bool)

(assert (=> b!445035 (=> (not res!264035) (not e!261642))))

(declare-datatypes ((List!7799 0))(
  ( (Nil!7796) (Cons!7795 (h!8651 (_ BitVec 64)) (t!13549 List!7799)) )
))
(declare-fun arrayNoDuplicates!0 (array!27480 (_ BitVec 32) List!7799) Bool)

(assert (=> b!445035 (= res!264035 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7796))))

(declare-fun b!445036 () Bool)

(declare-fun res!264030 () Bool)

(assert (=> b!445036 (=> (not res!264030) (not e!261642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445036 (= res!264030 (validMask!0 mask!1025))))

(declare-fun b!445037 () Bool)

(declare-fun e!261638 () Bool)

(assert (=> b!445037 (= e!261638 tp_is_empty!11833)))

(declare-fun b!445038 () Bool)

(declare-fun res!264036 () Bool)

(assert (=> b!445038 (=> (not res!264036) (not e!261642))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!445038 (= res!264036 (and (= (size!13540 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13539 _keys!709) (size!13540 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!445039 () Bool)

(declare-fun res!264028 () Bool)

(assert (=> b!445039 (=> (not res!264028) (not e!261642))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!445039 (= res!264028 (or (= (select (arr!13187 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13187 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445040 () Bool)

(declare-fun e!261640 () Bool)

(assert (=> b!445040 (= e!261640 false)))

(declare-fun lt!203609 () Bool)

(declare-fun lt!203610 () array!27480)

(assert (=> b!445040 (= lt!203609 (arrayNoDuplicates!0 lt!203610 #b00000000000000000000000000000000 Nil!7796))))

(declare-fun mapIsEmpty!19377 () Bool)

(declare-fun mapRes!19377 () Bool)

(assert (=> mapIsEmpty!19377 mapRes!19377))

(declare-fun b!445041 () Bool)

(declare-fun res!264029 () Bool)

(assert (=> b!445041 (=> (not res!264029) (not e!261642))))

(assert (=> b!445041 (= res!264029 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13539 _keys!709))))))

(declare-fun b!445042 () Bool)

(assert (=> b!445042 (= e!261641 (and e!261638 mapRes!19377))))

(declare-fun condMapEmpty!19377 () Bool)

(declare-fun mapDefault!19377 () ValueCell!5573)

(assert (=> b!445042 (= condMapEmpty!19377 (= (arr!13188 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5573)) mapDefault!19377)))))

(declare-fun b!445043 () Bool)

(declare-fun res!264033 () Bool)

(assert (=> b!445043 (=> (not res!264033) (not e!261642))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445043 (= res!264033 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19377 () Bool)

(declare-fun tp!37359 () Bool)

(assert (=> mapNonEmpty!19377 (= mapRes!19377 (and tp!37359 e!261637))))

(declare-fun mapValue!19377 () ValueCell!5573)

(declare-fun mapKey!19377 () (_ BitVec 32))

(declare-fun mapRest!19377 () (Array (_ BitVec 32) ValueCell!5573))

(assert (=> mapNonEmpty!19377 (= (arr!13188 _values!549) (store mapRest!19377 mapKey!19377 mapValue!19377))))

(declare-fun b!445044 () Bool)

(assert (=> b!445044 (= e!261642 e!261640)))

(declare-fun res!264031 () Bool)

(assert (=> b!445044 (=> (not res!264031) (not e!261640))))

(assert (=> b!445044 (= res!264031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203610 mask!1025))))

(assert (=> b!445044 (= lt!203610 (array!27481 (store (arr!13187 _keys!709) i!563 k0!794) (size!13539 _keys!709)))))

(declare-fun b!445045 () Bool)

(declare-fun res!264037 () Bool)

(assert (=> b!445045 (=> (not res!264037) (not e!261642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445045 (= res!264037 (validKeyInArray!0 k0!794))))

(assert (= (and start!40434 res!264032) b!445036))

(assert (= (and b!445036 res!264030) b!445038))

(assert (= (and b!445038 res!264036) b!445034))

(assert (= (and b!445034 res!264034) b!445035))

(assert (= (and b!445035 res!264035) b!445041))

(assert (= (and b!445041 res!264029) b!445045))

(assert (= (and b!445045 res!264037) b!445039))

(assert (= (and b!445039 res!264028) b!445043))

(assert (= (and b!445043 res!264033) b!445044))

(assert (= (and b!445044 res!264031) b!445040))

(assert (= (and b!445042 condMapEmpty!19377) mapIsEmpty!19377))

(assert (= (and b!445042 (not condMapEmpty!19377)) mapNonEmpty!19377))

(get-info :version)

(assert (= (and mapNonEmpty!19377 ((_ is ValueCellFull!5573) mapValue!19377)) b!445033))

(assert (= (and b!445042 ((_ is ValueCellFull!5573) mapDefault!19377)) b!445037))

(assert (= start!40434 b!445042))

(declare-fun m!430935 () Bool)

(assert (=> b!445039 m!430935))

(declare-fun m!430937 () Bool)

(assert (=> start!40434 m!430937))

(declare-fun m!430939 () Bool)

(assert (=> start!40434 m!430939))

(declare-fun m!430941 () Bool)

(assert (=> b!445036 m!430941))

(declare-fun m!430943 () Bool)

(assert (=> b!445043 m!430943))

(declare-fun m!430945 () Bool)

(assert (=> b!445044 m!430945))

(declare-fun m!430947 () Bool)

(assert (=> b!445044 m!430947))

(declare-fun m!430949 () Bool)

(assert (=> b!445045 m!430949))

(declare-fun m!430951 () Bool)

(assert (=> b!445040 m!430951))

(declare-fun m!430953 () Bool)

(assert (=> b!445035 m!430953))

(declare-fun m!430955 () Bool)

(assert (=> b!445034 m!430955))

(declare-fun m!430957 () Bool)

(assert (=> mapNonEmpty!19377 m!430957))

(check-sat (not b!445043) (not b!445034) (not b!445044) (not start!40434) tp_is_empty!11833 (not b!445045) (not b!445035) (not b!445036) (not mapNonEmpty!19377) (not b!445040))
(check-sat)
