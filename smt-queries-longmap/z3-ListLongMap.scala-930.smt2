; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20680 () Bool)

(assert start!20680)

(declare-fun b_free!5335 () Bool)

(declare-fun b_next!5335 () Bool)

(assert (=> start!20680 (= b_free!5335 (not b_next!5335))))

(declare-fun tp!19036 () Bool)

(declare-fun b_and!12055 () Bool)

(assert (=> start!20680 (= tp!19036 b_and!12055)))

(declare-fun b!206489 () Bool)

(declare-fun res!100053 () Bool)

(declare-fun e!134925 () Bool)

(assert (=> b!206489 (=> (not res!100053) (not e!134925))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9579 0))(
  ( (array!9580 (arr!4539 (Array (_ BitVec 32) (_ BitVec 64))) (size!4865 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9579)

(assert (=> b!206489 (= res!100053 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4865 _keys!825))))))

(declare-fun res!100052 () Bool)

(assert (=> start!20680 (=> (not res!100052) (not e!134925))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20680 (= res!100052 (validMask!0 mask!1149))))

(assert (=> start!20680 e!134925))

(declare-datatypes ((V!6569 0))(
  ( (V!6570 (val!2640 Int)) )
))
(declare-datatypes ((ValueCell!2252 0))(
  ( (ValueCellFull!2252 (v!4604 V!6569)) (EmptyCell!2252) )
))
(declare-datatypes ((array!9581 0))(
  ( (array!9582 (arr!4540 (Array (_ BitVec 32) ValueCell!2252)) (size!4866 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9581)

(declare-fun e!134928 () Bool)

(declare-fun array_inv!2979 (array!9581) Bool)

(assert (=> start!20680 (and (array_inv!2979 _values!649) e!134928)))

(assert (=> start!20680 true))

(declare-fun tp_is_empty!5191 () Bool)

(assert (=> start!20680 tp_is_empty!5191))

(declare-fun array_inv!2980 (array!9579) Bool)

(assert (=> start!20680 (array_inv!2980 _keys!825)))

(assert (=> start!20680 tp!19036))

(declare-fun mapNonEmpty!8855 () Bool)

(declare-fun mapRes!8855 () Bool)

(declare-fun tp!19037 () Bool)

(declare-fun e!134926 () Bool)

(assert (=> mapNonEmpty!8855 (= mapRes!8855 (and tp!19037 e!134926))))

(declare-fun mapKey!8855 () (_ BitVec 32))

(declare-fun mapRest!8855 () (Array (_ BitVec 32) ValueCell!2252))

(declare-fun mapValue!8855 () ValueCell!2252)

(assert (=> mapNonEmpty!8855 (= (arr!4540 _values!649) (store mapRest!8855 mapKey!8855 mapValue!8855))))

(declare-fun b!206490 () Bool)

(assert (=> b!206490 (= e!134926 tp_is_empty!5191)))

(declare-fun b!206491 () Bool)

(declare-fun res!100049 () Bool)

(assert (=> b!206491 (=> (not res!100049) (not e!134925))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!206491 (= res!100049 (= (select (arr!4539 _keys!825) i!601) k0!843))))

(declare-fun b!206492 () Bool)

(declare-fun e!134924 () Bool)

(assert (=> b!206492 (= e!134924 tp_is_empty!5191)))

(declare-fun b!206493 () Bool)

(declare-fun res!100054 () Bool)

(assert (=> b!206493 (=> (not res!100054) (not e!134925))))

(declare-datatypes ((List!2893 0))(
  ( (Nil!2890) (Cons!2889 (h!3531 (_ BitVec 64)) (t!7815 List!2893)) )
))
(declare-fun arrayNoDuplicates!0 (array!9579 (_ BitVec 32) List!2893) Bool)

(assert (=> b!206493 (= res!100054 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2890))))

(declare-fun b!206494 () Bool)

(declare-fun res!100055 () Bool)

(assert (=> b!206494 (=> (not res!100055) (not e!134925))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206494 (= res!100055 (validKeyInArray!0 k0!843))))

(declare-fun mapIsEmpty!8855 () Bool)

(assert (=> mapIsEmpty!8855 mapRes!8855))

(declare-fun b!206495 () Bool)

(assert (=> b!206495 (= e!134925 (not true))))

(declare-datatypes ((tuple2!3992 0))(
  ( (tuple2!3993 (_1!2007 (_ BitVec 64)) (_2!2007 V!6569)) )
))
(declare-datatypes ((List!2894 0))(
  ( (Nil!2891) (Cons!2890 (h!3532 tuple2!3992) (t!7816 List!2894)) )
))
(declare-datatypes ((ListLongMap!2895 0))(
  ( (ListLongMap!2896 (toList!1463 List!2894)) )
))
(declare-fun lt!105530 () ListLongMap!2895)

(declare-fun zeroValue!615 () V!6569)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6569)

(declare-fun getCurrentListMap!1004 (array!9579 array!9581 (_ BitVec 32) (_ BitVec 32) V!6569 V!6569 (_ BitVec 32) Int) ListLongMap!2895)

(assert (=> b!206495 (= lt!105530 (getCurrentListMap!1004 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105528 () array!9581)

(declare-fun lt!105527 () ListLongMap!2895)

(assert (=> b!206495 (= lt!105527 (getCurrentListMap!1004 _keys!825 lt!105528 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105529 () ListLongMap!2895)

(declare-fun lt!105533 () ListLongMap!2895)

(assert (=> b!206495 (and (= lt!105529 lt!105533) (= lt!105533 lt!105529))))

(declare-fun v!520 () V!6569)

(declare-fun lt!105531 () ListLongMap!2895)

(declare-fun +!512 (ListLongMap!2895 tuple2!3992) ListLongMap!2895)

(assert (=> b!206495 (= lt!105533 (+!512 lt!105531 (tuple2!3993 k0!843 v!520)))))

(declare-datatypes ((Unit!6264 0))(
  ( (Unit!6265) )
))
(declare-fun lt!105532 () Unit!6264)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!163 (array!9579 array!9581 (_ BitVec 32) (_ BitVec 32) V!6569 V!6569 (_ BitVec 32) (_ BitVec 64) V!6569 (_ BitVec 32) Int) Unit!6264)

(assert (=> b!206495 (= lt!105532 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!163 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!414 (array!9579 array!9581 (_ BitVec 32) (_ BitVec 32) V!6569 V!6569 (_ BitVec 32) Int) ListLongMap!2895)

(assert (=> b!206495 (= lt!105529 (getCurrentListMapNoExtraKeys!414 _keys!825 lt!105528 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206495 (= lt!105528 (array!9582 (store (arr!4540 _values!649) i!601 (ValueCellFull!2252 v!520)) (size!4866 _values!649)))))

(assert (=> b!206495 (= lt!105531 (getCurrentListMapNoExtraKeys!414 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206496 () Bool)

(declare-fun res!100050 () Bool)

(assert (=> b!206496 (=> (not res!100050) (not e!134925))))

(assert (=> b!206496 (= res!100050 (and (= (size!4866 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4865 _keys!825) (size!4866 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206497 () Bool)

(declare-fun res!100051 () Bool)

(assert (=> b!206497 (=> (not res!100051) (not e!134925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9579 (_ BitVec 32)) Bool)

(assert (=> b!206497 (= res!100051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206498 () Bool)

(assert (=> b!206498 (= e!134928 (and e!134924 mapRes!8855))))

(declare-fun condMapEmpty!8855 () Bool)

(declare-fun mapDefault!8855 () ValueCell!2252)

(assert (=> b!206498 (= condMapEmpty!8855 (= (arr!4540 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2252)) mapDefault!8855)))))

(assert (= (and start!20680 res!100052) b!206496))

(assert (= (and b!206496 res!100050) b!206497))

(assert (= (and b!206497 res!100051) b!206493))

(assert (= (and b!206493 res!100054) b!206489))

(assert (= (and b!206489 res!100053) b!206494))

(assert (= (and b!206494 res!100055) b!206491))

(assert (= (and b!206491 res!100049) b!206495))

(assert (= (and b!206498 condMapEmpty!8855) mapIsEmpty!8855))

(assert (= (and b!206498 (not condMapEmpty!8855)) mapNonEmpty!8855))

(get-info :version)

(assert (= (and mapNonEmpty!8855 ((_ is ValueCellFull!2252) mapValue!8855)) b!206490))

(assert (= (and b!206498 ((_ is ValueCellFull!2252) mapDefault!8855)) b!206492))

(assert (= start!20680 b!206498))

(declare-fun m!233763 () Bool)

(assert (=> mapNonEmpty!8855 m!233763))

(declare-fun m!233765 () Bool)

(assert (=> start!20680 m!233765))

(declare-fun m!233767 () Bool)

(assert (=> start!20680 m!233767))

(declare-fun m!233769 () Bool)

(assert (=> start!20680 m!233769))

(declare-fun m!233771 () Bool)

(assert (=> b!206491 m!233771))

(declare-fun m!233773 () Bool)

(assert (=> b!206494 m!233773))

(declare-fun m!233775 () Bool)

(assert (=> b!206497 m!233775))

(declare-fun m!233777 () Bool)

(assert (=> b!206495 m!233777))

(declare-fun m!233779 () Bool)

(assert (=> b!206495 m!233779))

(declare-fun m!233781 () Bool)

(assert (=> b!206495 m!233781))

(declare-fun m!233783 () Bool)

(assert (=> b!206495 m!233783))

(declare-fun m!233785 () Bool)

(assert (=> b!206495 m!233785))

(declare-fun m!233787 () Bool)

(assert (=> b!206495 m!233787))

(declare-fun m!233789 () Bool)

(assert (=> b!206495 m!233789))

(declare-fun m!233791 () Bool)

(assert (=> b!206493 m!233791))

(check-sat (not b!206495) (not b_next!5335) tp_is_empty!5191 (not mapNonEmpty!8855) (not b!206494) (not b!206493) b_and!12055 (not b!206497) (not start!20680))
(check-sat b_and!12055 (not b_next!5335))
