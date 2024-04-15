; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37650 () Bool)

(assert start!37650)

(declare-fun b_free!8767 () Bool)

(declare-fun b_next!8767 () Bool)

(assert (=> start!37650 (= b_free!8767 (not b_next!8767))))

(declare-fun tp!31052 () Bool)

(declare-fun b_and!15983 () Bool)

(assert (=> start!37650 (= tp!31052 b_and!15983)))

(declare-fun b!385390 () Bool)

(declare-fun res!219880 () Bool)

(declare-fun e!233898 () Bool)

(assert (=> b!385390 (=> (not res!219880) (not e!233898))))

(declare-datatypes ((array!22763 0))(
  ( (array!22764 (arr!10850 (Array (_ BitVec 32) (_ BitVec 64))) (size!11203 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22763)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!385390 (= res!219880 (or (= (select (arr!10850 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10850 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!385391 () Bool)

(declare-fun res!219878 () Bool)

(assert (=> b!385391 (=> (not res!219878) (not e!233898))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385391 (= res!219878 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!385392 () Bool)

(declare-fun e!233899 () Bool)

(declare-fun tp_is_empty!9439 () Bool)

(assert (=> b!385392 (= e!233899 tp_is_empty!9439)))

(declare-fun res!219884 () Bool)

(assert (=> start!37650 (=> (not res!219884) (not e!233898))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37650 (= res!219884 (validMask!0 mask!970))))

(assert (=> start!37650 e!233898))

(assert (=> start!37650 true))

(declare-datatypes ((V!13691 0))(
  ( (V!13692 (val!4764 Int)) )
))
(declare-datatypes ((ValueCell!4376 0))(
  ( (ValueCellFull!4376 (v!6955 V!13691)) (EmptyCell!4376) )
))
(declare-datatypes ((array!22765 0))(
  ( (array!22766 (arr!10851 (Array (_ BitVec 32) ValueCell!4376)) (size!11204 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22765)

(declare-fun e!233896 () Bool)

(declare-fun array_inv!7984 (array!22765) Bool)

(assert (=> start!37650 (and (array_inv!7984 _values!506) e!233896)))

(assert (=> start!37650 tp!31052))

(assert (=> start!37650 tp_is_empty!9439))

(declare-fun array_inv!7985 (array!22763) Bool)

(assert (=> start!37650 (array_inv!7985 _keys!658)))

(declare-fun mapIsEmpty!15723 () Bool)

(declare-fun mapRes!15723 () Bool)

(assert (=> mapIsEmpty!15723 mapRes!15723))

(declare-fun b!385393 () Bool)

(declare-fun res!219885 () Bool)

(assert (=> b!385393 (=> (not res!219885) (not e!233898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22763 (_ BitVec 32)) Bool)

(assert (=> b!385393 (= res!219885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385394 () Bool)

(declare-fun res!219886 () Bool)

(assert (=> b!385394 (=> (not res!219886) (not e!233898))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385394 (= res!219886 (validKeyInArray!0 k0!778))))

(declare-fun b!385395 () Bool)

(declare-fun res!219882 () Bool)

(assert (=> b!385395 (=> (not res!219882) (not e!233898))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!385395 (= res!219882 (and (= (size!11204 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11203 _keys!658) (size!11204 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385396 () Bool)

(declare-fun e!233897 () Bool)

(assert (=> b!385396 (= e!233898 e!233897)))

(declare-fun res!219887 () Bool)

(assert (=> b!385396 (=> (not res!219887) (not e!233897))))

(declare-fun lt!181410 () array!22763)

(assert (=> b!385396 (= res!219887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181410 mask!970))))

(assert (=> b!385396 (= lt!181410 (array!22764 (store (arr!10850 _keys!658) i!548 k0!778) (size!11203 _keys!658)))))

(declare-fun b!385397 () Bool)

(assert (=> b!385397 (= e!233897 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13691)

(declare-datatypes ((tuple2!6386 0))(
  ( (tuple2!6387 (_1!3204 (_ BitVec 64)) (_2!3204 V!13691)) )
))
(declare-datatypes ((List!6217 0))(
  ( (Nil!6214) (Cons!6213 (h!7069 tuple2!6386) (t!11358 List!6217)) )
))
(declare-datatypes ((ListLongMap!5289 0))(
  ( (ListLongMap!5290 (toList!2660 List!6217)) )
))
(declare-fun lt!181409 () ListLongMap!5289)

(declare-fun minValue!472 () V!13691)

(declare-fun getCurrentListMapNoExtraKeys!900 (array!22763 array!22765 (_ BitVec 32) (_ BitVec 32) V!13691 V!13691 (_ BitVec 32) Int) ListLongMap!5289)

(assert (=> b!385397 (= lt!181409 (getCurrentListMapNoExtraKeys!900 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!385398 () Bool)

(declare-fun e!233900 () Bool)

(assert (=> b!385398 (= e!233900 tp_is_empty!9439)))

(declare-fun b!385399 () Bool)

(assert (=> b!385399 (= e!233896 (and e!233900 mapRes!15723))))

(declare-fun condMapEmpty!15723 () Bool)

(declare-fun mapDefault!15723 () ValueCell!4376)

(assert (=> b!385399 (= condMapEmpty!15723 (= (arr!10851 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4376)) mapDefault!15723)))))

(declare-fun b!385400 () Bool)

(declare-fun res!219881 () Bool)

(assert (=> b!385400 (=> (not res!219881) (not e!233898))))

(assert (=> b!385400 (= res!219881 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11203 _keys!658))))))

(declare-fun b!385401 () Bool)

(declare-fun res!219883 () Bool)

(assert (=> b!385401 (=> (not res!219883) (not e!233897))))

(declare-datatypes ((List!6218 0))(
  ( (Nil!6215) (Cons!6214 (h!7070 (_ BitVec 64)) (t!11359 List!6218)) )
))
(declare-fun arrayNoDuplicates!0 (array!22763 (_ BitVec 32) List!6218) Bool)

(assert (=> b!385401 (= res!219883 (arrayNoDuplicates!0 lt!181410 #b00000000000000000000000000000000 Nil!6215))))

(declare-fun b!385402 () Bool)

(declare-fun res!219879 () Bool)

(assert (=> b!385402 (=> (not res!219879) (not e!233898))))

(assert (=> b!385402 (= res!219879 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6215))))

(declare-fun mapNonEmpty!15723 () Bool)

(declare-fun tp!31053 () Bool)

(assert (=> mapNonEmpty!15723 (= mapRes!15723 (and tp!31053 e!233899))))

(declare-fun mapRest!15723 () (Array (_ BitVec 32) ValueCell!4376))

(declare-fun mapValue!15723 () ValueCell!4376)

(declare-fun mapKey!15723 () (_ BitVec 32))

(assert (=> mapNonEmpty!15723 (= (arr!10851 _values!506) (store mapRest!15723 mapKey!15723 mapValue!15723))))

(assert (= (and start!37650 res!219884) b!385395))

(assert (= (and b!385395 res!219882) b!385393))

(assert (= (and b!385393 res!219885) b!385402))

(assert (= (and b!385402 res!219879) b!385400))

(assert (= (and b!385400 res!219881) b!385394))

(assert (= (and b!385394 res!219886) b!385390))

(assert (= (and b!385390 res!219880) b!385391))

(assert (= (and b!385391 res!219878) b!385396))

(assert (= (and b!385396 res!219887) b!385401))

(assert (= (and b!385401 res!219883) b!385397))

(assert (= (and b!385399 condMapEmpty!15723) mapIsEmpty!15723))

(assert (= (and b!385399 (not condMapEmpty!15723)) mapNonEmpty!15723))

(get-info :version)

(assert (= (and mapNonEmpty!15723 ((_ is ValueCellFull!4376) mapValue!15723)) b!385392))

(assert (= (and b!385399 ((_ is ValueCellFull!4376) mapDefault!15723)) b!385398))

(assert (= start!37650 b!385399))

(declare-fun m!381485 () Bool)

(assert (=> b!385401 m!381485))

(declare-fun m!381487 () Bool)

(assert (=> b!385391 m!381487))

(declare-fun m!381489 () Bool)

(assert (=> b!385393 m!381489))

(declare-fun m!381491 () Bool)

(assert (=> start!37650 m!381491))

(declare-fun m!381493 () Bool)

(assert (=> start!37650 m!381493))

(declare-fun m!381495 () Bool)

(assert (=> start!37650 m!381495))

(declare-fun m!381497 () Bool)

(assert (=> mapNonEmpty!15723 m!381497))

(declare-fun m!381499 () Bool)

(assert (=> b!385396 m!381499))

(declare-fun m!381501 () Bool)

(assert (=> b!385396 m!381501))

(declare-fun m!381503 () Bool)

(assert (=> b!385390 m!381503))

(declare-fun m!381505 () Bool)

(assert (=> b!385397 m!381505))

(declare-fun m!381507 () Bool)

(assert (=> b!385402 m!381507))

(declare-fun m!381509 () Bool)

(assert (=> b!385394 m!381509))

(check-sat (not b!385394) (not b!385397) b_and!15983 (not start!37650) (not b_next!8767) tp_is_empty!9439 (not b!385401) (not b!385393) (not b!385402) (not b!385391) (not mapNonEmpty!15723) (not b!385396))
(check-sat b_and!15983 (not b_next!8767))
