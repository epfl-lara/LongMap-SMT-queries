; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21080 () Bool)

(assert start!21080)

(declare-fun b_free!5587 () Bool)

(declare-fun b_next!5587 () Bool)

(assert (=> start!21080 (= b_free!5587 (not b_next!5587))))

(declare-fun tp!19822 () Bool)

(declare-fun b_and!12391 () Bool)

(assert (=> start!21080 (= tp!19822 b_and!12391)))

(declare-fun b!211836 () Bool)

(declare-fun e!137858 () Bool)

(declare-fun e!137857 () Bool)

(declare-fun mapRes!9263 () Bool)

(assert (=> b!211836 (= e!137858 (and e!137857 mapRes!9263))))

(declare-fun condMapEmpty!9263 () Bool)

(declare-datatypes ((V!6913 0))(
  ( (V!6914 (val!2769 Int)) )
))
(declare-datatypes ((ValueCell!2381 0))(
  ( (ValueCellFull!2381 (v!4761 V!6913)) (EmptyCell!2381) )
))
(declare-datatypes ((array!10091 0))(
  ( (array!10092 (arr!4788 (Array (_ BitVec 32) ValueCell!2381)) (size!5114 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10091)

(declare-fun mapDefault!9263 () ValueCell!2381)

(assert (=> b!211836 (= condMapEmpty!9263 (= (arr!4788 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2381)) mapDefault!9263)))))

(declare-fun b!211837 () Bool)

(declare-fun res!103487 () Bool)

(declare-fun e!137856 () Bool)

(assert (=> b!211837 (=> (not res!103487) (not e!137856))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!10093 0))(
  ( (array!10094 (arr!4789 (Array (_ BitVec 32) (_ BitVec 64))) (size!5115 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10093)

(assert (=> b!211837 (= res!103487 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5115 _keys!825))))))

(declare-fun b!211838 () Bool)

(declare-fun res!103479 () Bool)

(assert (=> b!211838 (=> (not res!103479) (not e!137856))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10093 (_ BitVec 32)) Bool)

(assert (=> b!211838 (= res!103479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!211839 () Bool)

(declare-fun tp_is_empty!5449 () Bool)

(assert (=> b!211839 (= e!137857 tp_is_empty!5449)))

(declare-fun b!211840 () Bool)

(declare-fun e!137855 () Bool)

(assert (=> b!211840 (= e!137856 (not e!137855))))

(declare-fun res!103480 () Bool)

(assert (=> b!211840 (=> res!103480 e!137855)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!211840 (= res!103480 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6913)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6913)

(declare-datatypes ((tuple2!4160 0))(
  ( (tuple2!4161 (_1!2091 (_ BitVec 64)) (_2!2091 V!6913)) )
))
(declare-datatypes ((List!3068 0))(
  ( (Nil!3065) (Cons!3064 (h!3706 tuple2!4160) (t!8004 List!3068)) )
))
(declare-datatypes ((ListLongMap!3063 0))(
  ( (ListLongMap!3064 (toList!1547 List!3068)) )
))
(declare-fun lt!108947 () ListLongMap!3063)

(declare-fun getCurrentListMap!1059 (array!10093 array!10091 (_ BitVec 32) (_ BitVec 32) V!6913 V!6913 (_ BitVec 32) Int) ListLongMap!3063)

(assert (=> b!211840 (= lt!108947 (getCurrentListMap!1059 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108952 () ListLongMap!3063)

(declare-fun lt!108944 () array!10091)

(assert (=> b!211840 (= lt!108952 (getCurrentListMap!1059 _keys!825 lt!108944 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108953 () ListLongMap!3063)

(declare-fun lt!108946 () ListLongMap!3063)

(assert (=> b!211840 (and (= lt!108953 lt!108946) (= lt!108946 lt!108953))))

(declare-fun lt!108942 () ListLongMap!3063)

(declare-fun lt!108951 () tuple2!4160)

(declare-fun +!571 (ListLongMap!3063 tuple2!4160) ListLongMap!3063)

(assert (=> b!211840 (= lt!108946 (+!571 lt!108942 lt!108951))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6913)

(assert (=> b!211840 (= lt!108951 (tuple2!4161 k0!843 v!520))))

(declare-datatypes ((Unit!6392 0))(
  ( (Unit!6393) )
))
(declare-fun lt!108945 () Unit!6392)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!220 (array!10093 array!10091 (_ BitVec 32) (_ BitVec 32) V!6913 V!6913 (_ BitVec 32) (_ BitVec 64) V!6913 (_ BitVec 32) Int) Unit!6392)

(assert (=> b!211840 (= lt!108945 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!220 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!496 (array!10093 array!10091 (_ BitVec 32) (_ BitVec 32) V!6913 V!6913 (_ BitVec 32) Int) ListLongMap!3063)

(assert (=> b!211840 (= lt!108953 (getCurrentListMapNoExtraKeys!496 _keys!825 lt!108944 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211840 (= lt!108944 (array!10092 (store (arr!4788 _values!649) i!601 (ValueCellFull!2381 v!520)) (size!5114 _values!649)))))

(assert (=> b!211840 (= lt!108942 (getCurrentListMapNoExtraKeys!496 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!9263 () Bool)

(declare-fun tp!19823 () Bool)

(declare-fun e!137859 () Bool)

(assert (=> mapNonEmpty!9263 (= mapRes!9263 (and tp!19823 e!137859))))

(declare-fun mapRest!9263 () (Array (_ BitVec 32) ValueCell!2381))

(declare-fun mapValue!9263 () ValueCell!2381)

(declare-fun mapKey!9263 () (_ BitVec 32))

(assert (=> mapNonEmpty!9263 (= (arr!4788 _values!649) (store mapRest!9263 mapKey!9263 mapValue!9263))))

(declare-fun b!211842 () Bool)

(declare-fun res!103483 () Bool)

(assert (=> b!211842 (=> (not res!103483) (not e!137856))))

(assert (=> b!211842 (= res!103483 (and (= (size!5114 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5115 _keys!825) (size!5114 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!211843 () Bool)

(declare-fun res!103481 () Bool)

(assert (=> b!211843 (=> (not res!103481) (not e!137856))))

(declare-datatypes ((List!3069 0))(
  ( (Nil!3066) (Cons!3065 (h!3707 (_ BitVec 64)) (t!8005 List!3069)) )
))
(declare-fun arrayNoDuplicates!0 (array!10093 (_ BitVec 32) List!3069) Bool)

(assert (=> b!211843 (= res!103481 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3066))))

(declare-fun b!211844 () Bool)

(declare-fun e!137854 () Bool)

(assert (=> b!211844 (= e!137854 (bvslt i!601 (size!5114 _values!649)))))

(declare-fun lt!108943 () ListLongMap!3063)

(declare-fun lt!108950 () ListLongMap!3063)

(assert (=> b!211844 (= lt!108943 (+!571 lt!108950 lt!108951))))

(declare-fun lt!108948 () Unit!6392)

(declare-fun addCommutativeForDiffKeys!199 (ListLongMap!3063 (_ BitVec 64) V!6913 (_ BitVec 64) V!6913) Unit!6392)

(assert (=> b!211844 (= lt!108948 (addCommutativeForDiffKeys!199 lt!108942 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!211841 () Bool)

(declare-fun res!103485 () Bool)

(assert (=> b!211841 (=> (not res!103485) (not e!137856))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!211841 (= res!103485 (validKeyInArray!0 k0!843))))

(declare-fun res!103484 () Bool)

(assert (=> start!21080 (=> (not res!103484) (not e!137856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21080 (= res!103484 (validMask!0 mask!1149))))

(assert (=> start!21080 e!137856))

(declare-fun array_inv!3143 (array!10091) Bool)

(assert (=> start!21080 (and (array_inv!3143 _values!649) e!137858)))

(assert (=> start!21080 true))

(assert (=> start!21080 tp_is_empty!5449))

(declare-fun array_inv!3144 (array!10093) Bool)

(assert (=> start!21080 (array_inv!3144 _keys!825)))

(assert (=> start!21080 tp!19822))

(declare-fun b!211845 () Bool)

(assert (=> b!211845 (= e!137859 tp_is_empty!5449)))

(declare-fun b!211846 () Bool)

(declare-fun res!103486 () Bool)

(assert (=> b!211846 (=> (not res!103486) (not e!137856))))

(assert (=> b!211846 (= res!103486 (= (select (arr!4789 _keys!825) i!601) k0!843))))

(declare-fun b!211847 () Bool)

(assert (=> b!211847 (= e!137855 e!137854)))

(declare-fun res!103482 () Bool)

(assert (=> b!211847 (=> res!103482 e!137854)))

(assert (=> b!211847 (= res!103482 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!211847 (= lt!108952 lt!108943)))

(declare-fun lt!108949 () tuple2!4160)

(assert (=> b!211847 (= lt!108943 (+!571 lt!108946 lt!108949))))

(assert (=> b!211847 (= lt!108947 lt!108950)))

(assert (=> b!211847 (= lt!108950 (+!571 lt!108942 lt!108949))))

(assert (=> b!211847 (= lt!108952 (+!571 lt!108953 lt!108949))))

(assert (=> b!211847 (= lt!108949 (tuple2!4161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapIsEmpty!9263 () Bool)

(assert (=> mapIsEmpty!9263 mapRes!9263))

(assert (= (and start!21080 res!103484) b!211842))

(assert (= (and b!211842 res!103483) b!211838))

(assert (= (and b!211838 res!103479) b!211843))

(assert (= (and b!211843 res!103481) b!211837))

(assert (= (and b!211837 res!103487) b!211841))

(assert (= (and b!211841 res!103485) b!211846))

(assert (= (and b!211846 res!103486) b!211840))

(assert (= (and b!211840 (not res!103480)) b!211847))

(assert (= (and b!211847 (not res!103482)) b!211844))

(assert (= (and b!211836 condMapEmpty!9263) mapIsEmpty!9263))

(assert (= (and b!211836 (not condMapEmpty!9263)) mapNonEmpty!9263))

(get-info :version)

(assert (= (and mapNonEmpty!9263 ((_ is ValueCellFull!2381) mapValue!9263)) b!211845))

(assert (= (and b!211836 ((_ is ValueCellFull!2381) mapDefault!9263)) b!211839))

(assert (= start!21080 b!211836))

(declare-fun m!239135 () Bool)

(assert (=> b!211843 m!239135))

(declare-fun m!239137 () Bool)

(assert (=> mapNonEmpty!9263 m!239137))

(declare-fun m!239139 () Bool)

(assert (=> start!21080 m!239139))

(declare-fun m!239141 () Bool)

(assert (=> start!21080 m!239141))

(declare-fun m!239143 () Bool)

(assert (=> start!21080 m!239143))

(declare-fun m!239145 () Bool)

(assert (=> b!211847 m!239145))

(declare-fun m!239147 () Bool)

(assert (=> b!211847 m!239147))

(declare-fun m!239149 () Bool)

(assert (=> b!211847 m!239149))

(declare-fun m!239151 () Bool)

(assert (=> b!211838 m!239151))

(declare-fun m!239153 () Bool)

(assert (=> b!211841 m!239153))

(declare-fun m!239155 () Bool)

(assert (=> b!211846 m!239155))

(declare-fun m!239157 () Bool)

(assert (=> b!211840 m!239157))

(declare-fun m!239159 () Bool)

(assert (=> b!211840 m!239159))

(declare-fun m!239161 () Bool)

(assert (=> b!211840 m!239161))

(declare-fun m!239163 () Bool)

(assert (=> b!211840 m!239163))

(declare-fun m!239165 () Bool)

(assert (=> b!211840 m!239165))

(declare-fun m!239167 () Bool)

(assert (=> b!211840 m!239167))

(declare-fun m!239169 () Bool)

(assert (=> b!211840 m!239169))

(declare-fun m!239171 () Bool)

(assert (=> b!211844 m!239171))

(declare-fun m!239173 () Bool)

(assert (=> b!211844 m!239173))

(check-sat (not start!21080) (not b!211844) b_and!12391 (not b_next!5587) tp_is_empty!5449 (not b!211840) (not mapNonEmpty!9263) (not b!211847) (not b!211843) (not b!211838) (not b!211841))
(check-sat b_and!12391 (not b_next!5587))
