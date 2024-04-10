; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3762 () Bool)

(assert start!3762)

(declare-fun res!15602 () Bool)

(declare-fun e!17066 () Bool)

(assert (=> start!3762 (=> (not res!15602) (not e!17066))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3762 (= res!15602 (validMask!0 mask!2294))))

(assert (=> start!3762 e!17066))

(assert (=> start!3762 true))

(declare-datatypes ((V!1269 0))(
  ( (V!1270 (val!568 Int)) )
))
(declare-datatypes ((ValueCell!342 0))(
  ( (ValueCellFull!342 (v!1654 V!1269)) (EmptyCell!342) )
))
(declare-datatypes ((array!1413 0))(
  ( (array!1414 (arr!664 (Array (_ BitVec 32) ValueCell!342)) (size!765 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1413)

(declare-fun e!17068 () Bool)

(declare-fun array_inv!451 (array!1413) Bool)

(assert (=> start!3762 (and (array_inv!451 _values!1501) e!17068)))

(declare-datatypes ((array!1415 0))(
  ( (array!1416 (arr!665 (Array (_ BitVec 32) (_ BitVec 64))) (size!766 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1415)

(declare-fun array_inv!452 (array!1415) Bool)

(assert (=> start!3762 (array_inv!452 _keys!1833)))

(declare-fun b!26252 () Bool)

(assert (=> b!26252 (= e!17066 false)))

(declare-fun lt!10334 () Bool)

(declare-datatypes ((List!584 0))(
  ( (Nil!581) (Cons!580 (h!1147 (_ BitVec 64)) (t!3271 List!584)) )
))
(declare-fun arrayNoDuplicates!0 (array!1415 (_ BitVec 32) List!584) Bool)

(assert (=> b!26252 (= lt!10334 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!581))))

(declare-fun mapIsEmpty!1141 () Bool)

(declare-fun mapRes!1141 () Bool)

(assert (=> mapIsEmpty!1141 mapRes!1141))

(declare-fun b!26253 () Bool)

(declare-fun e!17065 () Bool)

(declare-fun tp_is_empty!1083 () Bool)

(assert (=> b!26253 (= e!17065 tp_is_empty!1083)))

(declare-fun b!26254 () Bool)

(declare-fun e!17067 () Bool)

(assert (=> b!26254 (= e!17068 (and e!17067 mapRes!1141))))

(declare-fun condMapEmpty!1141 () Bool)

(declare-fun mapDefault!1141 () ValueCell!342)

(assert (=> b!26254 (= condMapEmpty!1141 (= (arr!664 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!342)) mapDefault!1141)))))

(declare-fun b!26255 () Bool)

(declare-fun res!15601 () Bool)

(assert (=> b!26255 (=> (not res!15601) (not e!17066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1415 (_ BitVec 32)) Bool)

(assert (=> b!26255 (= res!15601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26256 () Bool)

(assert (=> b!26256 (= e!17067 tp_is_empty!1083)))

(declare-fun b!26257 () Bool)

(declare-fun res!15603 () Bool)

(assert (=> b!26257 (=> (not res!15603) (not e!17066))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26257 (= res!15603 (and (= (size!765 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!766 _keys!1833) (size!765 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1141 () Bool)

(declare-fun tp!3661 () Bool)

(assert (=> mapNonEmpty!1141 (= mapRes!1141 (and tp!3661 e!17065))))

(declare-fun mapValue!1141 () ValueCell!342)

(declare-fun mapRest!1141 () (Array (_ BitVec 32) ValueCell!342))

(declare-fun mapKey!1141 () (_ BitVec 32))

(assert (=> mapNonEmpty!1141 (= (arr!664 _values!1501) (store mapRest!1141 mapKey!1141 mapValue!1141))))

(assert (= (and start!3762 res!15602) b!26257))

(assert (= (and b!26257 res!15603) b!26255))

(assert (= (and b!26255 res!15601) b!26252))

(assert (= (and b!26254 condMapEmpty!1141) mapIsEmpty!1141))

(assert (= (and b!26254 (not condMapEmpty!1141)) mapNonEmpty!1141))

(get-info :version)

(assert (= (and mapNonEmpty!1141 ((_ is ValueCellFull!342) mapValue!1141)) b!26253))

(assert (= (and b!26254 ((_ is ValueCellFull!342) mapDefault!1141)) b!26256))

(assert (= start!3762 b!26254))

(declare-fun m!21089 () Bool)

(assert (=> start!3762 m!21089))

(declare-fun m!21091 () Bool)

(assert (=> start!3762 m!21091))

(declare-fun m!21093 () Bool)

(assert (=> start!3762 m!21093))

(declare-fun m!21095 () Bool)

(assert (=> b!26252 m!21095))

(declare-fun m!21097 () Bool)

(assert (=> b!26255 m!21097))

(declare-fun m!21099 () Bool)

(assert (=> mapNonEmpty!1141 m!21099))

(check-sat (not b!26252) (not b!26255) (not start!3762) (not mapNonEmpty!1141) tp_is_empty!1083)
(check-sat)
