; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21048 () Bool)

(assert start!21048)

(declare-fun b_free!5575 () Bool)

(declare-fun b_next!5575 () Bool)

(assert (=> start!21048 (= b_free!5575 (not b_next!5575))))

(declare-fun tp!19783 () Bool)

(declare-fun b_and!12367 () Bool)

(assert (=> start!21048 (= tp!19783 b_and!12367)))

(declare-fun b!211421 () Bool)

(declare-fun e!137613 () Bool)

(declare-fun tp_is_empty!5437 () Bool)

(assert (=> b!211421 (= e!137613 tp_is_empty!5437)))

(declare-datatypes ((V!6897 0))(
  ( (V!6898 (val!2763 Int)) )
))
(declare-datatypes ((tuple2!4154 0))(
  ( (tuple2!4155 (_1!2088 (_ BitVec 64)) (_2!2088 V!6897)) )
))
(declare-datatypes ((List!3062 0))(
  ( (Nil!3059) (Cons!3058 (h!3700 tuple2!4154) (t!7996 List!3062)) )
))
(declare-datatypes ((ListLongMap!3057 0))(
  ( (ListLongMap!3058 (toList!1544 List!3062)) )
))
(declare-fun lt!108639 () ListLongMap!3057)

(declare-fun b!211422 () Bool)

(declare-fun lt!108640 () tuple2!4154)

(declare-fun e!137614 () Bool)

(declare-fun lt!108643 () ListLongMap!3057)

(declare-fun +!568 (ListLongMap!3057 tuple2!4154) ListLongMap!3057)

(assert (=> b!211422 (= e!137614 (= lt!108643 (+!568 lt!108639 lt!108640)))))

(declare-fun e!137610 () Bool)

(assert (=> b!211422 e!137610))

(declare-fun res!103232 () Bool)

(assert (=> b!211422 (=> (not res!103232) (not e!137610))))

(declare-fun lt!108644 () ListLongMap!3057)

(assert (=> b!211422 (= res!103232 (= lt!108643 (+!568 lt!108644 lt!108640)))))

(declare-fun zeroValue!615 () V!6897)

(assert (=> b!211422 (= lt!108640 (tuple2!4155 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!211423 () Bool)

(declare-fun e!137608 () Bool)

(assert (=> b!211423 (= e!137608 (not e!137614))))

(declare-fun res!103229 () Bool)

(assert (=> b!211423 (=> res!103229 e!137614)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!211423 (= res!103229 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!108642 () ListLongMap!3057)

(declare-datatypes ((ValueCell!2375 0))(
  ( (ValueCellFull!2375 (v!4751 V!6897)) (EmptyCell!2375) )
))
(declare-datatypes ((array!10067 0))(
  ( (array!10068 (arr!4777 (Array (_ BitVec 32) ValueCell!2375)) (size!5103 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10067)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((array!10069 0))(
  ( (array!10070 (arr!4778 (Array (_ BitVec 32) (_ BitVec 64))) (size!5104 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10069)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6897)

(declare-fun getCurrentListMap!1056 (array!10069 array!10067 (_ BitVec 32) (_ BitVec 32) V!6897 V!6897 (_ BitVec 32) Int) ListLongMap!3057)

(assert (=> b!211423 (= lt!108642 (getCurrentListMap!1056 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108638 () array!10067)

(assert (=> b!211423 (= lt!108643 (getCurrentListMap!1056 _keys!825 lt!108638 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211423 (and (= lt!108644 lt!108639) (= lt!108639 lt!108644))))

(declare-fun lt!108645 () ListLongMap!3057)

(declare-fun v!520 () V!6897)

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!211423 (= lt!108639 (+!568 lt!108645 (tuple2!4155 k0!843 v!520)))))

(declare-datatypes ((Unit!6384 0))(
  ( (Unit!6385) )
))
(declare-fun lt!108641 () Unit!6384)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!217 (array!10069 array!10067 (_ BitVec 32) (_ BitVec 32) V!6897 V!6897 (_ BitVec 32) (_ BitVec 64) V!6897 (_ BitVec 32) Int) Unit!6384)

(assert (=> b!211423 (= lt!108641 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!217 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!493 (array!10069 array!10067 (_ BitVec 32) (_ BitVec 32) V!6897 V!6897 (_ BitVec 32) Int) ListLongMap!3057)

(assert (=> b!211423 (= lt!108644 (getCurrentListMapNoExtraKeys!493 _keys!825 lt!108638 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211423 (= lt!108638 (array!10068 (store (arr!4777 _values!649) i!601 (ValueCellFull!2375 v!520)) (size!5103 _values!649)))))

(assert (=> b!211423 (= lt!108645 (getCurrentListMapNoExtraKeys!493 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211424 () Bool)

(declare-fun e!137612 () Bool)

(declare-fun mapRes!9242 () Bool)

(assert (=> b!211424 (= e!137612 (and e!137613 mapRes!9242))))

(declare-fun condMapEmpty!9242 () Bool)

(declare-fun mapDefault!9242 () ValueCell!2375)

(assert (=> b!211424 (= condMapEmpty!9242 (= (arr!4777 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2375)) mapDefault!9242)))))

(declare-fun b!211425 () Bool)

(declare-fun res!103233 () Bool)

(assert (=> b!211425 (=> (not res!103233) (not e!137608))))

(declare-datatypes ((List!3063 0))(
  ( (Nil!3060) (Cons!3059 (h!3701 (_ BitVec 64)) (t!7997 List!3063)) )
))
(declare-fun arrayNoDuplicates!0 (array!10069 (_ BitVec 32) List!3063) Bool)

(assert (=> b!211425 (= res!103233 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3060))))

(declare-fun b!211426 () Bool)

(declare-fun res!103226 () Bool)

(assert (=> b!211426 (=> (not res!103226) (not e!137608))))

(assert (=> b!211426 (= res!103226 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5104 _keys!825))))))

(declare-fun b!211427 () Bool)

(declare-fun res!103234 () Bool)

(assert (=> b!211427 (=> (not res!103234) (not e!137608))))

(assert (=> b!211427 (= res!103234 (and (= (size!5103 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5104 _keys!825) (size!5103 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!211429 () Bool)

(declare-fun res!103227 () Bool)

(assert (=> b!211429 (=> (not res!103227) (not e!137608))))

(assert (=> b!211429 (= res!103227 (= (select (arr!4778 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!9242 () Bool)

(assert (=> mapIsEmpty!9242 mapRes!9242))

(declare-fun b!211430 () Bool)

(declare-fun res!103231 () Bool)

(assert (=> b!211430 (=> (not res!103231) (not e!137608))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!211430 (= res!103231 (validKeyInArray!0 k0!843))))

(declare-fun b!211431 () Bool)

(assert (=> b!211431 (= e!137610 (= lt!108642 (+!568 lt!108645 lt!108640)))))

(declare-fun b!211432 () Bool)

(declare-fun e!137609 () Bool)

(assert (=> b!211432 (= e!137609 tp_is_empty!5437)))

(declare-fun mapNonEmpty!9242 () Bool)

(declare-fun tp!19784 () Bool)

(assert (=> mapNonEmpty!9242 (= mapRes!9242 (and tp!19784 e!137609))))

(declare-fun mapRest!9242 () (Array (_ BitVec 32) ValueCell!2375))

(declare-fun mapKey!9242 () (_ BitVec 32))

(declare-fun mapValue!9242 () ValueCell!2375)

(assert (=> mapNonEmpty!9242 (= (arr!4777 _values!649) (store mapRest!9242 mapKey!9242 mapValue!9242))))

(declare-fun res!103230 () Bool)

(assert (=> start!21048 (=> (not res!103230) (not e!137608))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21048 (= res!103230 (validMask!0 mask!1149))))

(assert (=> start!21048 e!137608))

(declare-fun array_inv!3135 (array!10067) Bool)

(assert (=> start!21048 (and (array_inv!3135 _values!649) e!137612)))

(assert (=> start!21048 true))

(assert (=> start!21048 tp_is_empty!5437))

(declare-fun array_inv!3136 (array!10069) Bool)

(assert (=> start!21048 (array_inv!3136 _keys!825)))

(assert (=> start!21048 tp!19783))

(declare-fun b!211428 () Bool)

(declare-fun res!103228 () Bool)

(assert (=> b!211428 (=> (not res!103228) (not e!137608))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10069 (_ BitVec 32)) Bool)

(assert (=> b!211428 (= res!103228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!21048 res!103230) b!211427))

(assert (= (and b!211427 res!103234) b!211428))

(assert (= (and b!211428 res!103228) b!211425))

(assert (= (and b!211425 res!103233) b!211426))

(assert (= (and b!211426 res!103226) b!211430))

(assert (= (and b!211430 res!103231) b!211429))

(assert (= (and b!211429 res!103227) b!211423))

(assert (= (and b!211423 (not res!103229)) b!211422))

(assert (= (and b!211422 res!103232) b!211431))

(assert (= (and b!211424 condMapEmpty!9242) mapIsEmpty!9242))

(assert (= (and b!211424 (not condMapEmpty!9242)) mapNonEmpty!9242))

(get-info :version)

(assert (= (and mapNonEmpty!9242 ((_ is ValueCellFull!2375) mapValue!9242)) b!211432))

(assert (= (and b!211424 ((_ is ValueCellFull!2375) mapDefault!9242)) b!211421))

(assert (= start!21048 b!211424))

(declare-fun m!238705 () Bool)

(assert (=> b!211425 m!238705))

(declare-fun m!238707 () Bool)

(assert (=> b!211423 m!238707))

(declare-fun m!238709 () Bool)

(assert (=> b!211423 m!238709))

(declare-fun m!238711 () Bool)

(assert (=> b!211423 m!238711))

(declare-fun m!238713 () Bool)

(assert (=> b!211423 m!238713))

(declare-fun m!238715 () Bool)

(assert (=> b!211423 m!238715))

(declare-fun m!238717 () Bool)

(assert (=> b!211423 m!238717))

(declare-fun m!238719 () Bool)

(assert (=> b!211423 m!238719))

(declare-fun m!238721 () Bool)

(assert (=> b!211428 m!238721))

(declare-fun m!238723 () Bool)

(assert (=> b!211430 m!238723))

(declare-fun m!238725 () Bool)

(assert (=> start!21048 m!238725))

(declare-fun m!238727 () Bool)

(assert (=> start!21048 m!238727))

(declare-fun m!238729 () Bool)

(assert (=> start!21048 m!238729))

(declare-fun m!238731 () Bool)

(assert (=> b!211431 m!238731))

(declare-fun m!238733 () Bool)

(assert (=> b!211422 m!238733))

(declare-fun m!238735 () Bool)

(assert (=> b!211422 m!238735))

(declare-fun m!238737 () Bool)

(assert (=> b!211429 m!238737))

(declare-fun m!238739 () Bool)

(assert (=> mapNonEmpty!9242 m!238739))

(check-sat (not b_next!5575) (not start!21048) (not b!211431) tp_is_empty!5437 (not b!211425) (not b!211422) (not b!211423) b_and!12367 (not b!211430) (not b!211428) (not mapNonEmpty!9242))
(check-sat b_and!12367 (not b_next!5575))
