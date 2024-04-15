; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40446 () Bool)

(assert start!40446)

(declare-fun b!445047 () Bool)

(declare-fun res!264092 () Bool)

(declare-fun e!261604 () Bool)

(assert (=> b!445047 (=> (not res!264092) (not e!261604))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27501 0))(
  ( (array!27502 (arr!13198 (Array (_ BitVec 32) (_ BitVec 64))) (size!13551 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27501)

(assert (=> b!445047 (= res!264092 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13551 _keys!709))))))

(declare-fun b!445048 () Bool)

(declare-fun e!261607 () Bool)

(declare-fun tp_is_empty!11845 () Bool)

(assert (=> b!445048 (= e!261607 tp_is_empty!11845)))

(declare-fun b!445049 () Bool)

(declare-fun res!264085 () Bool)

(assert (=> b!445049 (=> (not res!264085) (not e!261604))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445049 (= res!264085 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!19395 () Bool)

(declare-fun mapRes!19395 () Bool)

(assert (=> mapIsEmpty!19395 mapRes!19395))

(declare-fun b!445051 () Bool)

(declare-fun res!264089 () Bool)

(assert (=> b!445051 (=> (not res!264089) (not e!261604))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445051 (= res!264089 (validKeyInArray!0 k0!794))))

(declare-fun b!445052 () Bool)

(declare-fun res!264094 () Bool)

(assert (=> b!445052 (=> (not res!264094) (not e!261604))))

(assert (=> b!445052 (= res!264094 (or (= (select (arr!13198 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13198 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445053 () Bool)

(declare-fun res!264090 () Bool)

(declare-fun e!261608 () Bool)

(assert (=> b!445053 (=> (not res!264090) (not e!261608))))

(declare-fun lt!203390 () array!27501)

(declare-datatypes ((List!7895 0))(
  ( (Nil!7892) (Cons!7891 (h!8747 (_ BitVec 64)) (t!13644 List!7895)) )
))
(declare-fun arrayNoDuplicates!0 (array!27501 (_ BitVec 32) List!7895) Bool)

(assert (=> b!445053 (= res!264090 (arrayNoDuplicates!0 lt!203390 #b00000000000000000000000000000000 Nil!7892))))

(declare-fun b!445054 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!445054 (= e!261608 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13551 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsge (bvsub (size!13551 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (bvsub (size!13551 _keys!709) from!863))))))

(declare-fun b!445055 () Bool)

(declare-fun e!261606 () Bool)

(assert (=> b!445055 (= e!261606 tp_is_empty!11845)))

(declare-fun b!445056 () Bool)

(declare-fun res!264091 () Bool)

(assert (=> b!445056 (=> (not res!264091) (not e!261604))))

(declare-fun arrayContainsKey!0 (array!27501 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445056 (= res!264091 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!445057 () Bool)

(declare-fun res!264088 () Bool)

(assert (=> b!445057 (=> (not res!264088) (not e!261604))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16899 0))(
  ( (V!16900 (val!5967 Int)) )
))
(declare-datatypes ((ValueCell!5579 0))(
  ( (ValueCellFull!5579 (v!8212 V!16899)) (EmptyCell!5579) )
))
(declare-datatypes ((array!27503 0))(
  ( (array!27504 (arr!13199 (Array (_ BitVec 32) ValueCell!5579)) (size!13552 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27503)

(assert (=> b!445057 (= res!264088 (and (= (size!13552 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13551 _keys!709) (size!13552 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!445058 () Bool)

(declare-fun res!264084 () Bool)

(assert (=> b!445058 (=> (not res!264084) (not e!261604))))

(assert (=> b!445058 (= res!264084 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7892))))

(declare-fun mapNonEmpty!19395 () Bool)

(declare-fun tp!37377 () Bool)

(assert (=> mapNonEmpty!19395 (= mapRes!19395 (and tp!37377 e!261607))))

(declare-fun mapRest!19395 () (Array (_ BitVec 32) ValueCell!5579))

(declare-fun mapValue!19395 () ValueCell!5579)

(declare-fun mapKey!19395 () (_ BitVec 32))

(assert (=> mapNonEmpty!19395 (= (arr!13199 _values!549) (store mapRest!19395 mapKey!19395 mapValue!19395))))

(declare-fun b!445050 () Bool)

(assert (=> b!445050 (= e!261604 e!261608)))

(declare-fun res!264093 () Bool)

(assert (=> b!445050 (=> (not res!264093) (not e!261608))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27501 (_ BitVec 32)) Bool)

(assert (=> b!445050 (= res!264093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203390 mask!1025))))

(assert (=> b!445050 (= lt!203390 (array!27502 (store (arr!13198 _keys!709) i!563 k0!794) (size!13551 _keys!709)))))

(declare-fun res!264086 () Bool)

(assert (=> start!40446 (=> (not res!264086) (not e!261604))))

(assert (=> start!40446 (= res!264086 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13551 _keys!709))))))

(assert (=> start!40446 e!261604))

(assert (=> start!40446 true))

(declare-fun e!261605 () Bool)

(declare-fun array_inv!9622 (array!27503) Bool)

(assert (=> start!40446 (and (array_inv!9622 _values!549) e!261605)))

(declare-fun array_inv!9623 (array!27501) Bool)

(assert (=> start!40446 (array_inv!9623 _keys!709)))

(declare-fun b!445059 () Bool)

(declare-fun res!264087 () Bool)

(assert (=> b!445059 (=> (not res!264087) (not e!261604))))

(assert (=> b!445059 (= res!264087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!445060 () Bool)

(assert (=> b!445060 (= e!261605 (and e!261606 mapRes!19395))))

(declare-fun condMapEmpty!19395 () Bool)

(declare-fun mapDefault!19395 () ValueCell!5579)

(assert (=> b!445060 (= condMapEmpty!19395 (= (arr!13199 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5579)) mapDefault!19395)))))

(assert (= (and start!40446 res!264086) b!445049))

(assert (= (and b!445049 res!264085) b!445057))

(assert (= (and b!445057 res!264088) b!445059))

(assert (= (and b!445059 res!264087) b!445058))

(assert (= (and b!445058 res!264084) b!445047))

(assert (= (and b!445047 res!264092) b!445051))

(assert (= (and b!445051 res!264089) b!445052))

(assert (= (and b!445052 res!264094) b!445056))

(assert (= (and b!445056 res!264091) b!445050))

(assert (= (and b!445050 res!264093) b!445053))

(assert (= (and b!445053 res!264090) b!445054))

(assert (= (and b!445060 condMapEmpty!19395) mapIsEmpty!19395))

(assert (= (and b!445060 (not condMapEmpty!19395)) mapNonEmpty!19395))

(get-info :version)

(assert (= (and mapNonEmpty!19395 ((_ is ValueCellFull!5579) mapValue!19395)) b!445048))

(assert (= (and b!445060 ((_ is ValueCellFull!5579) mapDefault!19395)) b!445055))

(assert (= start!40446 b!445060))

(declare-fun m!430129 () Bool)

(assert (=> b!445050 m!430129))

(declare-fun m!430131 () Bool)

(assert (=> b!445050 m!430131))

(declare-fun m!430133 () Bool)

(assert (=> b!445051 m!430133))

(declare-fun m!430135 () Bool)

(assert (=> b!445059 m!430135))

(declare-fun m!430137 () Bool)

(assert (=> b!445053 m!430137))

(declare-fun m!430139 () Bool)

(assert (=> mapNonEmpty!19395 m!430139))

(declare-fun m!430141 () Bool)

(assert (=> b!445058 m!430141))

(declare-fun m!430143 () Bool)

(assert (=> b!445049 m!430143))

(declare-fun m!430145 () Bool)

(assert (=> b!445056 m!430145))

(declare-fun m!430147 () Bool)

(assert (=> start!40446 m!430147))

(declare-fun m!430149 () Bool)

(assert (=> start!40446 m!430149))

(declare-fun m!430151 () Bool)

(assert (=> b!445052 m!430151))

(check-sat (not b!445058) (not b!445053) (not start!40446) (not b!445050) (not mapNonEmpty!19395) (not b!445056) (not b!445049) (not b!445051) tp_is_empty!11845 (not b!445059))
(check-sat)
