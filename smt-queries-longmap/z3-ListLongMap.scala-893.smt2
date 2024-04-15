; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20458 () Bool)

(assert start!20458)

(declare-fun b_free!5113 () Bool)

(declare-fun b_next!5113 () Bool)

(assert (=> start!20458 (= b_free!5113 (not b_next!5113))))

(declare-fun tp!18370 () Bool)

(declare-fun b_and!11833 () Bool)

(assert (=> start!20458 (= tp!18370 b_and!11833)))

(declare-fun b!202524 () Bool)

(declare-fun res!97083 () Bool)

(declare-fun e!132635 () Bool)

(assert (=> b!202524 (=> (not res!97083) (not e!132635))))

(declare-datatypes ((array!9149 0))(
  ( (array!9150 (arr!4324 (Array (_ BitVec 32) (_ BitVec 64))) (size!4650 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9149)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9149 (_ BitVec 32)) Bool)

(assert (=> b!202524 (= res!97083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!202525 () Bool)

(declare-fun e!132636 () Bool)

(declare-fun e!132639 () Bool)

(declare-fun mapRes!8522 () Bool)

(assert (=> b!202525 (= e!132636 (and e!132639 mapRes!8522))))

(declare-fun condMapEmpty!8522 () Bool)

(declare-datatypes ((V!6273 0))(
  ( (V!6274 (val!2529 Int)) )
))
(declare-datatypes ((ValueCell!2141 0))(
  ( (ValueCellFull!2141 (v!4493 V!6273)) (EmptyCell!2141) )
))
(declare-datatypes ((array!9151 0))(
  ( (array!9152 (arr!4325 (Array (_ BitVec 32) ValueCell!2141)) (size!4651 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9151)

(declare-fun mapDefault!8522 () ValueCell!2141)

(assert (=> b!202525 (= condMapEmpty!8522 (= (arr!4325 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2141)) mapDefault!8522)))))

(declare-fun b!202526 () Bool)

(declare-fun tp_is_empty!4969 () Bool)

(assert (=> b!202526 (= e!132639 tp_is_empty!4969)))

(declare-fun b!202527 () Bool)

(declare-fun res!97091 () Bool)

(assert (=> b!202527 (=> (not res!97091) (not e!132635))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!202527 (= res!97091 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4650 _keys!825))))))

(declare-fun b!202528 () Bool)

(declare-fun e!132638 () Bool)

(assert (=> b!202528 (= e!132638 true)))

(declare-datatypes ((tuple2!3810 0))(
  ( (tuple2!3811 (_1!1916 (_ BitVec 64)) (_2!1916 V!6273)) )
))
(declare-datatypes ((List!2723 0))(
  ( (Nil!2720) (Cons!2719 (h!3361 tuple2!3810) (t!7645 List!2723)) )
))
(declare-datatypes ((ListLongMap!2713 0))(
  ( (ListLongMap!2714 (toList!1372 List!2723)) )
))
(declare-fun lt!101672 () ListLongMap!2713)

(declare-fun lt!101675 () ListLongMap!2713)

(declare-fun lt!101669 () tuple2!3810)

(declare-fun +!421 (ListLongMap!2713 tuple2!3810) ListLongMap!2713)

(assert (=> b!202528 (= lt!101672 (+!421 lt!101675 lt!101669))))

(declare-fun v!520 () V!6273)

(declare-datatypes ((Unit!6092 0))(
  ( (Unit!6093) )
))
(declare-fun lt!101670 () Unit!6092)

(declare-fun zeroValue!615 () V!6273)

(declare-fun lt!101671 () ListLongMap!2713)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!125 (ListLongMap!2713 (_ BitVec 64) V!6273 (_ BitVec 64) V!6273) Unit!6092)

(assert (=> b!202528 (= lt!101670 (addCommutativeForDiffKeys!125 lt!101671 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202529 () Bool)

(declare-fun e!132634 () Bool)

(assert (=> b!202529 (= e!132634 tp_is_empty!4969)))

(declare-fun b!202530 () Bool)

(declare-fun e!132637 () Bool)

(assert (=> b!202530 (= e!132635 (not e!132637))))

(declare-fun res!97086 () Bool)

(assert (=> b!202530 (=> res!97086 e!132637)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202530 (= res!97086 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!101668 () ListLongMap!2713)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6273)

(declare-fun getCurrentListMap!926 (array!9149 array!9151 (_ BitVec 32) (_ BitVec 32) V!6273 V!6273 (_ BitVec 32) Int) ListLongMap!2713)

(assert (=> b!202530 (= lt!101668 (getCurrentListMap!926 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101677 () array!9151)

(declare-fun lt!101673 () ListLongMap!2713)

(assert (=> b!202530 (= lt!101673 (getCurrentListMap!926 _keys!825 lt!101677 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101674 () ListLongMap!2713)

(declare-fun lt!101678 () ListLongMap!2713)

(assert (=> b!202530 (and (= lt!101674 lt!101678) (= lt!101678 lt!101674))))

(assert (=> b!202530 (= lt!101678 (+!421 lt!101671 lt!101669))))

(assert (=> b!202530 (= lt!101669 (tuple2!3811 k0!843 v!520))))

(declare-fun lt!101676 () Unit!6092)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!85 (array!9149 array!9151 (_ BitVec 32) (_ BitVec 32) V!6273 V!6273 (_ BitVec 32) (_ BitVec 64) V!6273 (_ BitVec 32) Int) Unit!6092)

(assert (=> b!202530 (= lt!101676 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!85 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!336 (array!9149 array!9151 (_ BitVec 32) (_ BitVec 32) V!6273 V!6273 (_ BitVec 32) Int) ListLongMap!2713)

(assert (=> b!202530 (= lt!101674 (getCurrentListMapNoExtraKeys!336 _keys!825 lt!101677 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202530 (= lt!101677 (array!9152 (store (arr!4325 _values!649) i!601 (ValueCellFull!2141 v!520)) (size!4651 _values!649)))))

(assert (=> b!202530 (= lt!101671 (getCurrentListMapNoExtraKeys!336 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!202531 () Bool)

(declare-fun res!97090 () Bool)

(assert (=> b!202531 (=> (not res!97090) (not e!132635))))

(declare-datatypes ((List!2724 0))(
  ( (Nil!2721) (Cons!2720 (h!3362 (_ BitVec 64)) (t!7646 List!2724)) )
))
(declare-fun arrayNoDuplicates!0 (array!9149 (_ BitVec 32) List!2724) Bool)

(assert (=> b!202531 (= res!97090 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2721))))

(declare-fun b!202532 () Bool)

(declare-fun res!97084 () Bool)

(assert (=> b!202532 (=> (not res!97084) (not e!132635))))

(assert (=> b!202532 (= res!97084 (and (= (size!4651 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4650 _keys!825) (size!4651 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!202533 () Bool)

(assert (=> b!202533 (= e!132637 e!132638)))

(declare-fun res!97089 () Bool)

(assert (=> b!202533 (=> res!97089 e!132638)))

(assert (=> b!202533 (= res!97089 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!202533 (= lt!101673 lt!101672)))

(declare-fun lt!101667 () tuple2!3810)

(assert (=> b!202533 (= lt!101672 (+!421 lt!101678 lt!101667))))

(assert (=> b!202533 (= lt!101668 lt!101675)))

(assert (=> b!202533 (= lt!101675 (+!421 lt!101671 lt!101667))))

(assert (=> b!202533 (= lt!101673 (+!421 lt!101674 lt!101667))))

(assert (=> b!202533 (= lt!101667 (tuple2!3811 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapNonEmpty!8522 () Bool)

(declare-fun tp!18371 () Bool)

(assert (=> mapNonEmpty!8522 (= mapRes!8522 (and tp!18371 e!132634))))

(declare-fun mapRest!8522 () (Array (_ BitVec 32) ValueCell!2141))

(declare-fun mapValue!8522 () ValueCell!2141)

(declare-fun mapKey!8522 () (_ BitVec 32))

(assert (=> mapNonEmpty!8522 (= (arr!4325 _values!649) (store mapRest!8522 mapKey!8522 mapValue!8522))))

(declare-fun mapIsEmpty!8522 () Bool)

(assert (=> mapIsEmpty!8522 mapRes!8522))

(declare-fun b!202534 () Bool)

(declare-fun res!97088 () Bool)

(assert (=> b!202534 (=> (not res!97088) (not e!132635))))

(assert (=> b!202534 (= res!97088 (= (select (arr!4324 _keys!825) i!601) k0!843))))

(declare-fun b!202535 () Bool)

(declare-fun res!97085 () Bool)

(assert (=> b!202535 (=> (not res!97085) (not e!132635))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202535 (= res!97085 (validKeyInArray!0 k0!843))))

(declare-fun res!97087 () Bool)

(assert (=> start!20458 (=> (not res!97087) (not e!132635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20458 (= res!97087 (validMask!0 mask!1149))))

(assert (=> start!20458 e!132635))

(declare-fun array_inv!2837 (array!9151) Bool)

(assert (=> start!20458 (and (array_inv!2837 _values!649) e!132636)))

(assert (=> start!20458 true))

(assert (=> start!20458 tp_is_empty!4969))

(declare-fun array_inv!2838 (array!9149) Bool)

(assert (=> start!20458 (array_inv!2838 _keys!825)))

(assert (=> start!20458 tp!18370))

(assert (= (and start!20458 res!97087) b!202532))

(assert (= (and b!202532 res!97084) b!202524))

(assert (= (and b!202524 res!97083) b!202531))

(assert (= (and b!202531 res!97090) b!202527))

(assert (= (and b!202527 res!97091) b!202535))

(assert (= (and b!202535 res!97085) b!202534))

(assert (= (and b!202534 res!97088) b!202530))

(assert (= (and b!202530 (not res!97086)) b!202533))

(assert (= (and b!202533 (not res!97089)) b!202528))

(assert (= (and b!202525 condMapEmpty!8522) mapIsEmpty!8522))

(assert (= (and b!202525 (not condMapEmpty!8522)) mapNonEmpty!8522))

(get-info :version)

(assert (= (and mapNonEmpty!8522 ((_ is ValueCellFull!2141) mapValue!8522)) b!202529))

(assert (= (and b!202525 ((_ is ValueCellFull!2141) mapDefault!8522)) b!202526))

(assert (= start!20458 b!202525))

(declare-fun m!229395 () Bool)

(assert (=> mapNonEmpty!8522 m!229395))

(declare-fun m!229397 () Bool)

(assert (=> b!202533 m!229397))

(declare-fun m!229399 () Bool)

(assert (=> b!202533 m!229399))

(declare-fun m!229401 () Bool)

(assert (=> b!202533 m!229401))

(declare-fun m!229403 () Bool)

(assert (=> b!202530 m!229403))

(declare-fun m!229405 () Bool)

(assert (=> b!202530 m!229405))

(declare-fun m!229407 () Bool)

(assert (=> b!202530 m!229407))

(declare-fun m!229409 () Bool)

(assert (=> b!202530 m!229409))

(declare-fun m!229411 () Bool)

(assert (=> b!202530 m!229411))

(declare-fun m!229413 () Bool)

(assert (=> b!202530 m!229413))

(declare-fun m!229415 () Bool)

(assert (=> b!202530 m!229415))

(declare-fun m!229417 () Bool)

(assert (=> start!20458 m!229417))

(declare-fun m!229419 () Bool)

(assert (=> start!20458 m!229419))

(declare-fun m!229421 () Bool)

(assert (=> start!20458 m!229421))

(declare-fun m!229423 () Bool)

(assert (=> b!202531 m!229423))

(declare-fun m!229425 () Bool)

(assert (=> b!202524 m!229425))

(declare-fun m!229427 () Bool)

(assert (=> b!202528 m!229427))

(declare-fun m!229429 () Bool)

(assert (=> b!202528 m!229429))

(declare-fun m!229431 () Bool)

(assert (=> b!202534 m!229431))

(declare-fun m!229433 () Bool)

(assert (=> b!202535 m!229433))

(check-sat (not b!202528) (not b_next!5113) (not b!202533) (not b!202530) (not b!202524) (not mapNonEmpty!8522) tp_is_empty!4969 b_and!11833 (not b!202531) (not b!202535) (not start!20458))
(check-sat b_and!11833 (not b_next!5113))
