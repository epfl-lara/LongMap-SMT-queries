; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20752 () Bool)

(assert start!20752)

(declare-fun b_free!5407 () Bool)

(declare-fun b_next!5407 () Bool)

(assert (=> start!20752 (= b_free!5407 (not b_next!5407))))

(declare-fun tp!19253 () Bool)

(declare-fun b_and!12167 () Bool)

(assert (=> start!20752 (= tp!19253 b_and!12167)))

(declare-fun b!207763 () Bool)

(declare-fun e!135593 () Bool)

(declare-fun tp_is_empty!5263 () Bool)

(assert (=> b!207763 (= e!135593 tp_is_empty!5263)))

(declare-fun res!100923 () Bool)

(declare-fun e!135589 () Bool)

(assert (=> start!20752 (=> (not res!100923) (not e!135589))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20752 (= res!100923 (validMask!0 mask!1149))))

(assert (=> start!20752 e!135589))

(declare-datatypes ((V!6665 0))(
  ( (V!6666 (val!2676 Int)) )
))
(declare-datatypes ((ValueCell!2288 0))(
  ( (ValueCellFull!2288 (v!4647 V!6665)) (EmptyCell!2288) )
))
(declare-datatypes ((array!9729 0))(
  ( (array!9730 (arr!4615 (Array (_ BitVec 32) ValueCell!2288)) (size!4940 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9729)

(declare-fun e!135592 () Bool)

(declare-fun array_inv!3021 (array!9729) Bool)

(assert (=> start!20752 (and (array_inv!3021 _values!649) e!135592)))

(assert (=> start!20752 true))

(assert (=> start!20752 tp_is_empty!5263))

(declare-datatypes ((array!9731 0))(
  ( (array!9732 (arr!4616 (Array (_ BitVec 32) (_ BitVec 64))) (size!4941 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9731)

(declare-fun array_inv!3022 (array!9731) Bool)

(assert (=> start!20752 (array_inv!3022 _keys!825)))

(assert (=> start!20752 tp!19253))

(declare-fun b!207764 () Bool)

(declare-fun res!100925 () Bool)

(assert (=> b!207764 (=> (not res!100925) (not e!135589))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!207764 (= res!100925 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4941 _keys!825))))))

(declare-fun b!207765 () Bool)

(declare-fun res!100922 () Bool)

(assert (=> b!207765 (=> (not res!100922) (not e!135589))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!207765 (= res!100922 (= (select (arr!4616 _keys!825) i!601) k0!843))))

(declare-fun b!207766 () Bool)

(declare-fun res!100924 () Bool)

(assert (=> b!207766 (=> (not res!100924) (not e!135589))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!207766 (= res!100924 (and (= (size!4940 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4941 _keys!825) (size!4940 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!207767 () Bool)

(declare-fun res!100926 () Bool)

(assert (=> b!207767 (=> (not res!100926) (not e!135589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9731 (_ BitVec 32)) Bool)

(assert (=> b!207767 (= res!100926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8963 () Bool)

(declare-fun mapRes!8963 () Bool)

(declare-fun tp!19252 () Bool)

(declare-fun e!135591 () Bool)

(assert (=> mapNonEmpty!8963 (= mapRes!8963 (and tp!19252 e!135591))))

(declare-fun mapValue!8963 () ValueCell!2288)

(declare-fun mapRest!8963 () (Array (_ BitVec 32) ValueCell!2288))

(declare-fun mapKey!8963 () (_ BitVec 32))

(assert (=> mapNonEmpty!8963 (= (arr!4615 _values!649) (store mapRest!8963 mapKey!8963 mapValue!8963))))

(declare-fun b!207768 () Bool)

(declare-fun res!100921 () Bool)

(assert (=> b!207768 (=> (not res!100921) (not e!135589))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207768 (= res!100921 (validKeyInArray!0 k0!843))))

(declare-fun b!207769 () Bool)

(assert (=> b!207769 (= e!135591 tp_is_empty!5263)))

(declare-fun b!207770 () Bool)

(assert (=> b!207770 (= e!135592 (and e!135593 mapRes!8963))))

(declare-fun condMapEmpty!8963 () Bool)

(declare-fun mapDefault!8963 () ValueCell!2288)

(assert (=> b!207770 (= condMapEmpty!8963 (= (arr!4615 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2288)) mapDefault!8963)))))

(declare-fun b!207771 () Bool)

(assert (=> b!207771 (= e!135589 (not true))))

(declare-datatypes ((tuple2!4004 0))(
  ( (tuple2!4005 (_1!2013 (_ BitVec 64)) (_2!2013 V!6665)) )
))
(declare-datatypes ((List!2893 0))(
  ( (Nil!2890) (Cons!2889 (h!3531 tuple2!4004) (t!7816 List!2893)) )
))
(declare-datatypes ((ListLongMap!2919 0))(
  ( (ListLongMap!2920 (toList!1475 List!2893)) )
))
(declare-fun lt!106534 () ListLongMap!2919)

(declare-fun zeroValue!615 () V!6665)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6665)

(declare-fun getCurrentListMap!1045 (array!9731 array!9729 (_ BitVec 32) (_ BitVec 32) V!6665 V!6665 (_ BitVec 32) Int) ListLongMap!2919)

(assert (=> b!207771 (= lt!106534 (getCurrentListMap!1045 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106533 () ListLongMap!2919)

(declare-fun lt!106532 () array!9729)

(assert (=> b!207771 (= lt!106533 (getCurrentListMap!1045 _keys!825 lt!106532 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106538 () ListLongMap!2919)

(declare-fun lt!106537 () ListLongMap!2919)

(assert (=> b!207771 (and (= lt!106538 lt!106537) (= lt!106537 lt!106538))))

(declare-fun v!520 () V!6665)

(declare-fun lt!106536 () ListLongMap!2919)

(declare-fun +!529 (ListLongMap!2919 tuple2!4004) ListLongMap!2919)

(assert (=> b!207771 (= lt!106537 (+!529 lt!106536 (tuple2!4005 k0!843 v!520)))))

(declare-datatypes ((Unit!6334 0))(
  ( (Unit!6335) )
))
(declare-fun lt!106535 () Unit!6334)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!181 (array!9731 array!9729 (_ BitVec 32) (_ BitVec 32) V!6665 V!6665 (_ BitVec 32) (_ BitVec 64) V!6665 (_ BitVec 32) Int) Unit!6334)

(assert (=> b!207771 (= lt!106535 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!181 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!438 (array!9731 array!9729 (_ BitVec 32) (_ BitVec 32) V!6665 V!6665 (_ BitVec 32) Int) ListLongMap!2919)

(assert (=> b!207771 (= lt!106538 (getCurrentListMapNoExtraKeys!438 _keys!825 lt!106532 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207771 (= lt!106532 (array!9730 (store (arr!4615 _values!649) i!601 (ValueCellFull!2288 v!520)) (size!4940 _values!649)))))

(assert (=> b!207771 (= lt!106536 (getCurrentListMapNoExtraKeys!438 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8963 () Bool)

(assert (=> mapIsEmpty!8963 mapRes!8963))

(declare-fun b!207772 () Bool)

(declare-fun res!100927 () Bool)

(assert (=> b!207772 (=> (not res!100927) (not e!135589))))

(declare-datatypes ((List!2894 0))(
  ( (Nil!2891) (Cons!2890 (h!3532 (_ BitVec 64)) (t!7817 List!2894)) )
))
(declare-fun arrayNoDuplicates!0 (array!9731 (_ BitVec 32) List!2894) Bool)

(assert (=> b!207772 (= res!100927 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2891))))

(assert (= (and start!20752 res!100923) b!207766))

(assert (= (and b!207766 res!100924) b!207767))

(assert (= (and b!207767 res!100926) b!207772))

(assert (= (and b!207772 res!100927) b!207764))

(assert (= (and b!207764 res!100925) b!207768))

(assert (= (and b!207768 res!100921) b!207765))

(assert (= (and b!207765 res!100922) b!207771))

(assert (= (and b!207770 condMapEmpty!8963) mapIsEmpty!8963))

(assert (= (and b!207770 (not condMapEmpty!8963)) mapNonEmpty!8963))

(get-info :version)

(assert (= (and mapNonEmpty!8963 ((_ is ValueCellFull!2288) mapValue!8963)) b!207769))

(assert (= (and b!207770 ((_ is ValueCellFull!2288) mapDefault!8963)) b!207763))

(assert (= start!20752 b!207770))

(declare-fun m!235641 () Bool)

(assert (=> mapNonEmpty!8963 m!235641))

(declare-fun m!235643 () Bool)

(assert (=> b!207767 m!235643))

(declare-fun m!235645 () Bool)

(assert (=> b!207772 m!235645))

(declare-fun m!235647 () Bool)

(assert (=> b!207768 m!235647))

(declare-fun m!235649 () Bool)

(assert (=> start!20752 m!235649))

(declare-fun m!235651 () Bool)

(assert (=> start!20752 m!235651))

(declare-fun m!235653 () Bool)

(assert (=> start!20752 m!235653))

(declare-fun m!235655 () Bool)

(assert (=> b!207771 m!235655))

(declare-fun m!235657 () Bool)

(assert (=> b!207771 m!235657))

(declare-fun m!235659 () Bool)

(assert (=> b!207771 m!235659))

(declare-fun m!235661 () Bool)

(assert (=> b!207771 m!235661))

(declare-fun m!235663 () Bool)

(assert (=> b!207771 m!235663))

(declare-fun m!235665 () Bool)

(assert (=> b!207771 m!235665))

(declare-fun m!235667 () Bool)

(assert (=> b!207771 m!235667))

(declare-fun m!235669 () Bool)

(assert (=> b!207765 m!235669))

(check-sat b_and!12167 (not mapNonEmpty!8963) (not b!207767) (not b!207772) (not b!207768) (not b!207771) (not b_next!5407) tp_is_empty!5263 (not start!20752))
(check-sat b_and!12167 (not b_next!5407))
