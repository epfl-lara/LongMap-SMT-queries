; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40440 () Bool)

(assert start!40440)

(declare-fun b!444928 () Bool)

(declare-fun e!261551 () Bool)

(declare-fun e!261552 () Bool)

(assert (=> b!444928 (= e!261551 e!261552)))

(declare-fun res!263995 () Bool)

(assert (=> b!444928 (=> (not res!263995) (not e!261552))))

(declare-datatypes ((array!27489 0))(
  ( (array!27490 (arr!13192 (Array (_ BitVec 32) (_ BitVec 64))) (size!13545 (_ BitVec 32))) )
))
(declare-fun lt!203374 () array!27489)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27489 (_ BitVec 32)) Bool)

(assert (=> b!444928 (= res!263995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203374 mask!1025))))

(declare-fun _keys!709 () array!27489)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444928 (= lt!203374 (array!27490 (store (arr!13192 _keys!709) i!563 k0!794) (size!13545 _keys!709)))))

(declare-fun b!444930 () Bool)

(declare-fun res!264001 () Bool)

(assert (=> b!444930 (=> (not res!264001) (not e!261551))))

(assert (=> b!444930 (= res!264001 (or (= (select (arr!13192 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13192 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444931 () Bool)

(assert (=> b!444931 (= e!261552 false)))

(declare-fun lt!203375 () Bool)

(declare-datatypes ((List!7892 0))(
  ( (Nil!7889) (Cons!7888 (h!8744 (_ BitVec 64)) (t!13641 List!7892)) )
))
(declare-fun arrayNoDuplicates!0 (array!27489 (_ BitVec 32) List!7892) Bool)

(assert (=> b!444931 (= lt!203375 (arrayNoDuplicates!0 lt!203374 #b00000000000000000000000000000000 Nil!7889))))

(declare-fun b!444932 () Bool)

(declare-fun e!261550 () Bool)

(declare-fun tp_is_empty!11839 () Bool)

(assert (=> b!444932 (= e!261550 tp_is_empty!11839)))

(declare-fun b!444933 () Bool)

(declare-fun e!261554 () Bool)

(declare-fun mapRes!19386 () Bool)

(assert (=> b!444933 (= e!261554 (and e!261550 mapRes!19386))))

(declare-fun condMapEmpty!19386 () Bool)

(declare-datatypes ((V!16891 0))(
  ( (V!16892 (val!5964 Int)) )
))
(declare-datatypes ((ValueCell!5576 0))(
  ( (ValueCellFull!5576 (v!8209 V!16891)) (EmptyCell!5576) )
))
(declare-datatypes ((array!27491 0))(
  ( (array!27492 (arr!13193 (Array (_ BitVec 32) ValueCell!5576)) (size!13546 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27491)

(declare-fun mapDefault!19386 () ValueCell!5576)

(assert (=> b!444933 (= condMapEmpty!19386 (= (arr!13193 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5576)) mapDefault!19386)))))

(declare-fun b!444934 () Bool)

(declare-fun res!264000 () Bool)

(assert (=> b!444934 (=> (not res!264000) (not e!261551))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!444934 (= res!264000 (and (= (size!13546 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13545 _keys!709) (size!13546 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444935 () Bool)

(declare-fun res!263998 () Bool)

(assert (=> b!444935 (=> (not res!263998) (not e!261551))))

(assert (=> b!444935 (= res!263998 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7889))))

(declare-fun b!444936 () Bool)

(declare-fun res!263997 () Bool)

(assert (=> b!444936 (=> (not res!263997) (not e!261551))))

(assert (=> b!444936 (= res!263997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!263999 () Bool)

(assert (=> start!40440 (=> (not res!263999) (not e!261551))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40440 (= res!263999 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13545 _keys!709))))))

(assert (=> start!40440 e!261551))

(assert (=> start!40440 true))

(declare-fun array_inv!9616 (array!27491) Bool)

(assert (=> start!40440 (and (array_inv!9616 _values!549) e!261554)))

(declare-fun array_inv!9617 (array!27489) Bool)

(assert (=> start!40440 (array_inv!9617 _keys!709)))

(declare-fun b!444929 () Bool)

(declare-fun res!263996 () Bool)

(assert (=> b!444929 (=> (not res!263996) (not e!261551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444929 (= res!263996 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!19386 () Bool)

(assert (=> mapIsEmpty!19386 mapRes!19386))

(declare-fun b!444937 () Bool)

(declare-fun res!263993 () Bool)

(assert (=> b!444937 (=> (not res!263993) (not e!261551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444937 (= res!263993 (validKeyInArray!0 k0!794))))

(declare-fun b!444938 () Bool)

(declare-fun res!263992 () Bool)

(assert (=> b!444938 (=> (not res!263992) (not e!261551))))

(declare-fun arrayContainsKey!0 (array!27489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444938 (= res!263992 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!444939 () Bool)

(declare-fun e!261553 () Bool)

(assert (=> b!444939 (= e!261553 tp_is_empty!11839)))

(declare-fun b!444940 () Bool)

(declare-fun res!263994 () Bool)

(assert (=> b!444940 (=> (not res!263994) (not e!261551))))

(assert (=> b!444940 (= res!263994 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13545 _keys!709))))))

(declare-fun mapNonEmpty!19386 () Bool)

(declare-fun tp!37368 () Bool)

(assert (=> mapNonEmpty!19386 (= mapRes!19386 (and tp!37368 e!261553))))

(declare-fun mapKey!19386 () (_ BitVec 32))

(declare-fun mapValue!19386 () ValueCell!5576)

(declare-fun mapRest!19386 () (Array (_ BitVec 32) ValueCell!5576))

(assert (=> mapNonEmpty!19386 (= (arr!13193 _values!549) (store mapRest!19386 mapKey!19386 mapValue!19386))))

(assert (= (and start!40440 res!263999) b!444929))

(assert (= (and b!444929 res!263996) b!444934))

(assert (= (and b!444934 res!264000) b!444936))

(assert (= (and b!444936 res!263997) b!444935))

(assert (= (and b!444935 res!263998) b!444940))

(assert (= (and b!444940 res!263994) b!444937))

(assert (= (and b!444937 res!263993) b!444930))

(assert (= (and b!444930 res!264001) b!444938))

(assert (= (and b!444938 res!263992) b!444928))

(assert (= (and b!444928 res!263995) b!444931))

(assert (= (and b!444933 condMapEmpty!19386) mapIsEmpty!19386))

(assert (= (and b!444933 (not condMapEmpty!19386)) mapNonEmpty!19386))

(get-info :version)

(assert (= (and mapNonEmpty!19386 ((_ is ValueCellFull!5576) mapValue!19386)) b!444939))

(assert (= (and b!444933 ((_ is ValueCellFull!5576) mapDefault!19386)) b!444932))

(assert (= start!40440 b!444933))

(declare-fun m!430057 () Bool)

(assert (=> start!40440 m!430057))

(declare-fun m!430059 () Bool)

(assert (=> start!40440 m!430059))

(declare-fun m!430061 () Bool)

(assert (=> b!444928 m!430061))

(declare-fun m!430063 () Bool)

(assert (=> b!444928 m!430063))

(declare-fun m!430065 () Bool)

(assert (=> b!444931 m!430065))

(declare-fun m!430067 () Bool)

(assert (=> b!444938 m!430067))

(declare-fun m!430069 () Bool)

(assert (=> b!444937 m!430069))

(declare-fun m!430071 () Bool)

(assert (=> b!444935 m!430071))

(declare-fun m!430073 () Bool)

(assert (=> mapNonEmpty!19386 m!430073))

(declare-fun m!430075 () Bool)

(assert (=> b!444930 m!430075))

(declare-fun m!430077 () Bool)

(assert (=> b!444936 m!430077))

(declare-fun m!430079 () Bool)

(assert (=> b!444929 m!430079))

(check-sat (not b!444929) (not b!444931) (not b!444928) (not b!444937) (not mapNonEmpty!19386) (not b!444936) (not b!444938) tp_is_empty!11839 (not b!444935) (not start!40440))
(check-sat)
