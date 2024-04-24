; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40350 () Bool)

(assert start!40350)

(declare-fun b!443395 () Bool)

(declare-fun e!260882 () Bool)

(assert (=> b!443395 (= e!260882 false)))

(declare-fun lt!203358 () Bool)

(declare-datatypes ((array!27312 0))(
  ( (array!27313 (arr!13103 (Array (_ BitVec 32) (_ BitVec 64))) (size!13455 (_ BitVec 32))) )
))
(declare-fun lt!203357 () array!27312)

(declare-datatypes ((List!7761 0))(
  ( (Nil!7758) (Cons!7757 (h!8613 (_ BitVec 64)) (t!13511 List!7761)) )
))
(declare-fun arrayNoDuplicates!0 (array!27312 (_ BitVec 32) List!7761) Bool)

(assert (=> b!443395 (= lt!203358 (arrayNoDuplicates!0 lt!203357 #b00000000000000000000000000000000 Nil!7758))))

(declare-fun b!443396 () Bool)

(declare-fun res!262774 () Bool)

(declare-fun e!260881 () Bool)

(assert (=> b!443396 (=> (not res!262774) (not e!260881))))

(declare-fun _keys!709 () array!27312)

(assert (=> b!443396 (= res!262774 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7758))))

(declare-fun b!443397 () Bool)

(declare-fun res!262770 () Bool)

(assert (=> b!443397 (=> (not res!262770) (not e!260881))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443397 (= res!262770 (validMask!0 mask!1025))))

(declare-fun b!443398 () Bool)

(assert (=> b!443398 (= e!260881 e!260882)))

(declare-fun res!262777 () Bool)

(assert (=> b!443398 (=> (not res!262777) (not e!260882))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27312 (_ BitVec 32)) Bool)

(assert (=> b!443398 (= res!262777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203357 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443398 (= lt!203357 (array!27313 (store (arr!13103 _keys!709) i!563 k0!794) (size!13455 _keys!709)))))

(declare-fun res!262775 () Bool)

(assert (=> start!40350 (=> (not res!262775) (not e!260881))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40350 (= res!262775 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13455 _keys!709))))))

(assert (=> start!40350 e!260881))

(assert (=> start!40350 true))

(declare-datatypes ((V!16771 0))(
  ( (V!16772 (val!5919 Int)) )
))
(declare-datatypes ((ValueCell!5531 0))(
  ( (ValueCellFull!5531 (v!8171 V!16771)) (EmptyCell!5531) )
))
(declare-datatypes ((array!27314 0))(
  ( (array!27315 (arr!13104 (Array (_ BitVec 32) ValueCell!5531)) (size!13456 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27314)

(declare-fun e!260884 () Bool)

(declare-fun array_inv!9574 (array!27314) Bool)

(assert (=> start!40350 (and (array_inv!9574 _values!549) e!260884)))

(declare-fun array_inv!9575 (array!27312) Bool)

(assert (=> start!40350 (array_inv!9575 _keys!709)))

(declare-fun b!443399 () Bool)

(declare-fun res!262768 () Bool)

(assert (=> b!443399 (=> (not res!262768) (not e!260881))))

(declare-fun arrayContainsKey!0 (array!27312 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443399 (= res!262768 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19251 () Bool)

(declare-fun mapRes!19251 () Bool)

(assert (=> mapIsEmpty!19251 mapRes!19251))

(declare-fun b!443400 () Bool)

(declare-fun res!262771 () Bool)

(assert (=> b!443400 (=> (not res!262771) (not e!260881))))

(assert (=> b!443400 (= res!262771 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13455 _keys!709))))))

(declare-fun b!443401 () Bool)

(declare-fun res!262769 () Bool)

(assert (=> b!443401 (=> (not res!262769) (not e!260881))))

(assert (=> b!443401 (= res!262769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443402 () Bool)

(declare-fun res!262776 () Bool)

(assert (=> b!443402 (=> (not res!262776) (not e!260881))))

(assert (=> b!443402 (= res!262776 (or (= (select (arr!13103 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13103 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443403 () Bool)

(declare-fun e!260885 () Bool)

(declare-fun tp_is_empty!11749 () Bool)

(assert (=> b!443403 (= e!260885 tp_is_empty!11749)))

(declare-fun b!443404 () Bool)

(declare-fun res!262772 () Bool)

(assert (=> b!443404 (=> (not res!262772) (not e!260881))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!443404 (= res!262772 (and (= (size!13456 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13455 _keys!709) (size!13456 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!443405 () Bool)

(declare-fun res!262773 () Bool)

(assert (=> b!443405 (=> (not res!262773) (not e!260881))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443405 (= res!262773 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!19251 () Bool)

(declare-fun tp!37233 () Bool)

(assert (=> mapNonEmpty!19251 (= mapRes!19251 (and tp!37233 e!260885))))

(declare-fun mapKey!19251 () (_ BitVec 32))

(declare-fun mapValue!19251 () ValueCell!5531)

(declare-fun mapRest!19251 () (Array (_ BitVec 32) ValueCell!5531))

(assert (=> mapNonEmpty!19251 (= (arr!13104 _values!549) (store mapRest!19251 mapKey!19251 mapValue!19251))))

(declare-fun b!443406 () Bool)

(declare-fun e!260886 () Bool)

(assert (=> b!443406 (= e!260884 (and e!260886 mapRes!19251))))

(declare-fun condMapEmpty!19251 () Bool)

(declare-fun mapDefault!19251 () ValueCell!5531)

(assert (=> b!443406 (= condMapEmpty!19251 (= (arr!13104 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5531)) mapDefault!19251)))))

(declare-fun b!443407 () Bool)

(assert (=> b!443407 (= e!260886 tp_is_empty!11749)))

(assert (= (and start!40350 res!262775) b!443397))

(assert (= (and b!443397 res!262770) b!443404))

(assert (= (and b!443404 res!262772) b!443401))

(assert (= (and b!443401 res!262769) b!443396))

(assert (= (and b!443396 res!262774) b!443400))

(assert (= (and b!443400 res!262771) b!443405))

(assert (= (and b!443405 res!262773) b!443402))

(assert (= (and b!443402 res!262776) b!443399))

(assert (= (and b!443399 res!262768) b!443398))

(assert (= (and b!443398 res!262777) b!443395))

(assert (= (and b!443406 condMapEmpty!19251) mapIsEmpty!19251))

(assert (= (and b!443406 (not condMapEmpty!19251)) mapNonEmpty!19251))

(get-info :version)

(assert (= (and mapNonEmpty!19251 ((_ is ValueCellFull!5531) mapValue!19251)) b!443403))

(assert (= (and b!443406 ((_ is ValueCellFull!5531) mapDefault!19251)) b!443407))

(assert (= start!40350 b!443406))

(declare-fun m!429927 () Bool)

(assert (=> b!443405 m!429927))

(declare-fun m!429929 () Bool)

(assert (=> mapNonEmpty!19251 m!429929))

(declare-fun m!429931 () Bool)

(assert (=> b!443396 m!429931))

(declare-fun m!429933 () Bool)

(assert (=> b!443401 m!429933))

(declare-fun m!429935 () Bool)

(assert (=> start!40350 m!429935))

(declare-fun m!429937 () Bool)

(assert (=> start!40350 m!429937))

(declare-fun m!429939 () Bool)

(assert (=> b!443402 m!429939))

(declare-fun m!429941 () Bool)

(assert (=> b!443395 m!429941))

(declare-fun m!429943 () Bool)

(assert (=> b!443398 m!429943))

(declare-fun m!429945 () Bool)

(assert (=> b!443398 m!429945))

(declare-fun m!429947 () Bool)

(assert (=> b!443399 m!429947))

(declare-fun m!429949 () Bool)

(assert (=> b!443397 m!429949))

(check-sat tp_is_empty!11749 (not b!443398) (not b!443401) (not start!40350) (not b!443396) (not b!443395) (not b!443405) (not mapNonEmpty!19251) (not b!443399) (not b!443397))
(check-sat)
