; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20758 () Bool)

(assert start!20758)

(declare-fun b_free!5413 () Bool)

(declare-fun b_next!5413 () Bool)

(assert (=> start!20758 (= b_free!5413 (not b_next!5413))))

(declare-fun tp!19270 () Bool)

(declare-fun b_and!12173 () Bool)

(assert (=> start!20758 (= tp!19270 b_and!12173)))

(declare-fun res!100988 () Bool)

(declare-fun e!135634 () Bool)

(assert (=> start!20758 (=> (not res!100988) (not e!135634))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20758 (= res!100988 (validMask!0 mask!1149))))

(assert (=> start!20758 e!135634))

(declare-datatypes ((V!6673 0))(
  ( (V!6674 (val!2679 Int)) )
))
(declare-datatypes ((ValueCell!2291 0))(
  ( (ValueCellFull!2291 (v!4650 V!6673)) (EmptyCell!2291) )
))
(declare-datatypes ((array!9741 0))(
  ( (array!9742 (arr!4621 (Array (_ BitVec 32) ValueCell!2291)) (size!4946 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9741)

(declare-fun e!135637 () Bool)

(declare-fun array_inv!3027 (array!9741) Bool)

(assert (=> start!20758 (and (array_inv!3027 _values!649) e!135637)))

(assert (=> start!20758 true))

(declare-fun tp_is_empty!5269 () Bool)

(assert (=> start!20758 tp_is_empty!5269))

(declare-datatypes ((array!9743 0))(
  ( (array!9744 (arr!4622 (Array (_ BitVec 32) (_ BitVec 64))) (size!4947 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9743)

(declare-fun array_inv!3028 (array!9743) Bool)

(assert (=> start!20758 (array_inv!3028 _keys!825)))

(assert (=> start!20758 tp!19270))

(declare-fun b!207853 () Bool)

(assert (=> b!207853 (= e!135634 (not true))))

(declare-fun zeroValue!615 () V!6673)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((tuple2!4008 0))(
  ( (tuple2!4009 (_1!2015 (_ BitVec 64)) (_2!2015 V!6673)) )
))
(declare-datatypes ((List!2897 0))(
  ( (Nil!2894) (Cons!2893 (h!3535 tuple2!4008) (t!7820 List!2897)) )
))
(declare-datatypes ((ListLongMap!2923 0))(
  ( (ListLongMap!2924 (toList!1477 List!2897)) )
))
(declare-fun lt!106596 () ListLongMap!2923)

(declare-fun minValue!615 () V!6673)

(declare-fun getCurrentListMap!1047 (array!9743 array!9741 (_ BitVec 32) (_ BitVec 32) V!6673 V!6673 (_ BitVec 32) Int) ListLongMap!2923)

(assert (=> b!207853 (= lt!106596 (getCurrentListMap!1047 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106597 () ListLongMap!2923)

(declare-fun lt!106601 () array!9741)

(assert (=> b!207853 (= lt!106597 (getCurrentListMap!1047 _keys!825 lt!106601 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106598 () ListLongMap!2923)

(declare-fun lt!106595 () ListLongMap!2923)

(assert (=> b!207853 (and (= lt!106598 lt!106595) (= lt!106595 lt!106598))))

(declare-fun lt!106600 () ListLongMap!2923)

(declare-fun v!520 () V!6673)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun +!531 (ListLongMap!2923 tuple2!4008) ListLongMap!2923)

(assert (=> b!207853 (= lt!106595 (+!531 lt!106600 (tuple2!4009 k0!843 v!520)))))

(declare-datatypes ((Unit!6338 0))(
  ( (Unit!6339) )
))
(declare-fun lt!106599 () Unit!6338)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!183 (array!9743 array!9741 (_ BitVec 32) (_ BitVec 32) V!6673 V!6673 (_ BitVec 32) (_ BitVec 64) V!6673 (_ BitVec 32) Int) Unit!6338)

(assert (=> b!207853 (= lt!106599 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!183 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!440 (array!9743 array!9741 (_ BitVec 32) (_ BitVec 32) V!6673 V!6673 (_ BitVec 32) Int) ListLongMap!2923)

(assert (=> b!207853 (= lt!106598 (getCurrentListMapNoExtraKeys!440 _keys!825 lt!106601 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207853 (= lt!106601 (array!9742 (store (arr!4621 _values!649) i!601 (ValueCellFull!2291 v!520)) (size!4946 _values!649)))))

(assert (=> b!207853 (= lt!106600 (getCurrentListMapNoExtraKeys!440 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207854 () Bool)

(declare-fun res!100989 () Bool)

(assert (=> b!207854 (=> (not res!100989) (not e!135634))))

(declare-datatypes ((List!2898 0))(
  ( (Nil!2895) (Cons!2894 (h!3536 (_ BitVec 64)) (t!7821 List!2898)) )
))
(declare-fun arrayNoDuplicates!0 (array!9743 (_ BitVec 32) List!2898) Bool)

(assert (=> b!207854 (= res!100989 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2895))))

(declare-fun b!207855 () Bool)

(declare-fun e!135635 () Bool)

(declare-fun mapRes!8972 () Bool)

(assert (=> b!207855 (= e!135637 (and e!135635 mapRes!8972))))

(declare-fun condMapEmpty!8972 () Bool)

(declare-fun mapDefault!8972 () ValueCell!2291)

(assert (=> b!207855 (= condMapEmpty!8972 (= (arr!4621 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2291)) mapDefault!8972)))))

(declare-fun b!207856 () Bool)

(declare-fun res!100985 () Bool)

(assert (=> b!207856 (=> (not res!100985) (not e!135634))))

(assert (=> b!207856 (= res!100985 (= (select (arr!4622 _keys!825) i!601) k0!843))))

(declare-fun b!207857 () Bool)

(declare-fun e!135636 () Bool)

(assert (=> b!207857 (= e!135636 tp_is_empty!5269)))

(declare-fun b!207858 () Bool)

(declare-fun res!100987 () Bool)

(assert (=> b!207858 (=> (not res!100987) (not e!135634))))

(assert (=> b!207858 (= res!100987 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4947 _keys!825))))))

(declare-fun b!207859 () Bool)

(assert (=> b!207859 (= e!135635 tp_is_empty!5269)))

(declare-fun b!207860 () Bool)

(declare-fun res!100986 () Bool)

(assert (=> b!207860 (=> (not res!100986) (not e!135634))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9743 (_ BitVec 32)) Bool)

(assert (=> b!207860 (= res!100986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207861 () Bool)

(declare-fun res!100990 () Bool)

(assert (=> b!207861 (=> (not res!100990) (not e!135634))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207861 (= res!100990 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8972 () Bool)

(declare-fun tp!19271 () Bool)

(assert (=> mapNonEmpty!8972 (= mapRes!8972 (and tp!19271 e!135636))))

(declare-fun mapValue!8972 () ValueCell!2291)

(declare-fun mapKey!8972 () (_ BitVec 32))

(declare-fun mapRest!8972 () (Array (_ BitVec 32) ValueCell!2291))

(assert (=> mapNonEmpty!8972 (= (arr!4621 _values!649) (store mapRest!8972 mapKey!8972 mapValue!8972))))

(declare-fun b!207862 () Bool)

(declare-fun res!100984 () Bool)

(assert (=> b!207862 (=> (not res!100984) (not e!135634))))

(assert (=> b!207862 (= res!100984 (and (= (size!4946 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4947 _keys!825) (size!4946 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8972 () Bool)

(assert (=> mapIsEmpty!8972 mapRes!8972))

(assert (= (and start!20758 res!100988) b!207862))

(assert (= (and b!207862 res!100984) b!207860))

(assert (= (and b!207860 res!100986) b!207854))

(assert (= (and b!207854 res!100989) b!207858))

(assert (= (and b!207858 res!100987) b!207861))

(assert (= (and b!207861 res!100990) b!207856))

(assert (= (and b!207856 res!100985) b!207853))

(assert (= (and b!207855 condMapEmpty!8972) mapIsEmpty!8972))

(assert (= (and b!207855 (not condMapEmpty!8972)) mapNonEmpty!8972))

(get-info :version)

(assert (= (and mapNonEmpty!8972 ((_ is ValueCellFull!2291) mapValue!8972)) b!207857))

(assert (= (and b!207855 ((_ is ValueCellFull!2291) mapDefault!8972)) b!207859))

(assert (= start!20758 b!207855))

(declare-fun m!235731 () Bool)

(assert (=> b!207853 m!235731))

(declare-fun m!235733 () Bool)

(assert (=> b!207853 m!235733))

(declare-fun m!235735 () Bool)

(assert (=> b!207853 m!235735))

(declare-fun m!235737 () Bool)

(assert (=> b!207853 m!235737))

(declare-fun m!235739 () Bool)

(assert (=> b!207853 m!235739))

(declare-fun m!235741 () Bool)

(assert (=> b!207853 m!235741))

(declare-fun m!235743 () Bool)

(assert (=> b!207853 m!235743))

(declare-fun m!235745 () Bool)

(assert (=> b!207856 m!235745))

(declare-fun m!235747 () Bool)

(assert (=> start!20758 m!235747))

(declare-fun m!235749 () Bool)

(assert (=> start!20758 m!235749))

(declare-fun m!235751 () Bool)

(assert (=> start!20758 m!235751))

(declare-fun m!235753 () Bool)

(assert (=> b!207861 m!235753))

(declare-fun m!235755 () Bool)

(assert (=> mapNonEmpty!8972 m!235755))

(declare-fun m!235757 () Bool)

(assert (=> b!207860 m!235757))

(declare-fun m!235759 () Bool)

(assert (=> b!207854 m!235759))

(check-sat (not start!20758) (not b!207854) b_and!12173 (not b!207861) (not b!207853) tp_is_empty!5269 (not mapNonEmpty!8972) (not b_next!5413) (not b!207860))
(check-sat b_and!12173 (not b_next!5413))
