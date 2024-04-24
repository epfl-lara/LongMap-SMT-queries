; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20830 () Bool)

(assert start!20830)

(declare-fun b_free!5479 () Bool)

(declare-fun b_next!5479 () Bool)

(assert (=> start!20830 (= b_free!5479 (not b_next!5479))))

(declare-fun tp!19477 () Bool)

(declare-fun b_and!12239 () Bool)

(assert (=> start!20830 (= tp!19477 b_and!12239)))

(declare-fun mapNonEmpty!9080 () Bool)

(declare-fun mapRes!9080 () Bool)

(declare-fun tp!19478 () Bool)

(declare-fun e!136174 () Bool)

(assert (=> mapNonEmpty!9080 (= mapRes!9080 (and tp!19478 e!136174))))

(declare-fun mapKey!9080 () (_ BitVec 32))

(declare-datatypes ((V!6769 0))(
  ( (V!6770 (val!2715 Int)) )
))
(declare-datatypes ((ValueCell!2327 0))(
  ( (ValueCellFull!2327 (v!4686 V!6769)) (EmptyCell!2327) )
))
(declare-fun mapRest!9080 () (Array (_ BitVec 32) ValueCell!2327))

(declare-datatypes ((array!9877 0))(
  ( (array!9878 (arr!4689 (Array (_ BitVec 32) ValueCell!2327)) (size!5014 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9877)

(declare-fun mapValue!9080 () ValueCell!2327)

(assert (=> mapNonEmpty!9080 (= (arr!4689 _values!649) (store mapRest!9080 mapKey!9080 mapValue!9080))))

(declare-fun b!208897 () Bool)

(declare-fun res!101707 () Bool)

(declare-fun e!136177 () Bool)

(assert (=> b!208897 (=> (not res!101707) (not e!136177))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9879 0))(
  ( (array!9880 (arr!4690 (Array (_ BitVec 32) (_ BitVec 64))) (size!5015 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9879)

(assert (=> b!208897 (= res!101707 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5015 _keys!825))))))

(declare-fun b!208898 () Bool)

(assert (=> b!208898 (= e!136177 false)))

(declare-datatypes ((tuple2!4050 0))(
  ( (tuple2!4051 (_1!2036 (_ BitVec 64)) (_2!2036 V!6769)) )
))
(declare-datatypes ((List!2937 0))(
  ( (Nil!2934) (Cons!2933 (h!3575 tuple2!4050) (t!7860 List!2937)) )
))
(declare-datatypes ((ListLongMap!2965 0))(
  ( (ListLongMap!2966 (toList!1498 List!2937)) )
))
(declare-fun lt!106927 () ListLongMap!2965)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun v!520 () V!6769)

(declare-fun zeroValue!615 () V!6769)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6769)

(declare-fun getCurrentListMapNoExtraKeys!461 (array!9879 array!9877 (_ BitVec 32) (_ BitVec 32) V!6769 V!6769 (_ BitVec 32) Int) ListLongMap!2965)

(assert (=> b!208898 (= lt!106927 (getCurrentListMapNoExtraKeys!461 _keys!825 (array!9878 (store (arr!4689 _values!649) i!601 (ValueCellFull!2327 v!520)) (size!5014 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106928 () ListLongMap!2965)

(assert (=> b!208898 (= lt!106928 (getCurrentListMapNoExtraKeys!461 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208899 () Bool)

(declare-fun res!101709 () Bool)

(assert (=> b!208899 (=> (not res!101709) (not e!136177))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208899 (= res!101709 (validKeyInArray!0 k0!843))))

(declare-fun b!208900 () Bool)

(declare-fun res!101708 () Bool)

(assert (=> b!208900 (=> (not res!101708) (not e!136177))))

(assert (=> b!208900 (= res!101708 (and (= (size!5014 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5015 _keys!825) (size!5014 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208901 () Bool)

(declare-fun res!101704 () Bool)

(assert (=> b!208901 (=> (not res!101704) (not e!136177))))

(declare-datatypes ((List!2938 0))(
  ( (Nil!2935) (Cons!2934 (h!3576 (_ BitVec 64)) (t!7861 List!2938)) )
))
(declare-fun arrayNoDuplicates!0 (array!9879 (_ BitVec 32) List!2938) Bool)

(assert (=> b!208901 (= res!101704 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2935))))

(declare-fun b!208902 () Bool)

(declare-fun res!101705 () Bool)

(assert (=> b!208902 (=> (not res!101705) (not e!136177))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9879 (_ BitVec 32)) Bool)

(assert (=> b!208902 (= res!101705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208903 () Bool)

(declare-fun tp_is_empty!5341 () Bool)

(assert (=> b!208903 (= e!136174 tp_is_empty!5341)))

(declare-fun res!101706 () Bool)

(assert (=> start!20830 (=> (not res!101706) (not e!136177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20830 (= res!101706 (validMask!0 mask!1149))))

(assert (=> start!20830 e!136177))

(declare-fun e!136175 () Bool)

(declare-fun array_inv!3075 (array!9877) Bool)

(assert (=> start!20830 (and (array_inv!3075 _values!649) e!136175)))

(assert (=> start!20830 true))

(assert (=> start!20830 tp_is_empty!5341))

(declare-fun array_inv!3076 (array!9879) Bool)

(assert (=> start!20830 (array_inv!3076 _keys!825)))

(assert (=> start!20830 tp!19477))

(declare-fun b!208904 () Bool)

(declare-fun e!136178 () Bool)

(assert (=> b!208904 (= e!136175 (and e!136178 mapRes!9080))))

(declare-fun condMapEmpty!9080 () Bool)

(declare-fun mapDefault!9080 () ValueCell!2327)

(assert (=> b!208904 (= condMapEmpty!9080 (= (arr!4689 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2327)) mapDefault!9080)))))

(declare-fun mapIsEmpty!9080 () Bool)

(assert (=> mapIsEmpty!9080 mapRes!9080))

(declare-fun b!208905 () Bool)

(declare-fun res!101710 () Bool)

(assert (=> b!208905 (=> (not res!101710) (not e!136177))))

(assert (=> b!208905 (= res!101710 (= (select (arr!4690 _keys!825) i!601) k0!843))))

(declare-fun b!208906 () Bool)

(assert (=> b!208906 (= e!136178 tp_is_empty!5341)))

(assert (= (and start!20830 res!101706) b!208900))

(assert (= (and b!208900 res!101708) b!208902))

(assert (= (and b!208902 res!101705) b!208901))

(assert (= (and b!208901 res!101704) b!208897))

(assert (= (and b!208897 res!101707) b!208899))

(assert (= (and b!208899 res!101709) b!208905))

(assert (= (and b!208905 res!101710) b!208898))

(assert (= (and b!208904 condMapEmpty!9080) mapIsEmpty!9080))

(assert (= (and b!208904 (not condMapEmpty!9080)) mapNonEmpty!9080))

(get-info :version)

(assert (= (and mapNonEmpty!9080 ((_ is ValueCellFull!2327) mapValue!9080)) b!208903))

(assert (= (and b!208904 ((_ is ValueCellFull!2327) mapDefault!9080)) b!208906))

(assert (= start!20830 b!208904))

(declare-fun m!236553 () Bool)

(assert (=> b!208905 m!236553))

(declare-fun m!236555 () Bool)

(assert (=> start!20830 m!236555))

(declare-fun m!236557 () Bool)

(assert (=> start!20830 m!236557))

(declare-fun m!236559 () Bool)

(assert (=> start!20830 m!236559))

(declare-fun m!236561 () Bool)

(assert (=> b!208902 m!236561))

(declare-fun m!236563 () Bool)

(assert (=> mapNonEmpty!9080 m!236563))

(declare-fun m!236565 () Bool)

(assert (=> b!208901 m!236565))

(declare-fun m!236567 () Bool)

(assert (=> b!208899 m!236567))

(declare-fun m!236569 () Bool)

(assert (=> b!208898 m!236569))

(declare-fun m!236571 () Bool)

(assert (=> b!208898 m!236571))

(declare-fun m!236573 () Bool)

(assert (=> b!208898 m!236573))

(check-sat (not b!208902) (not b!208901) tp_is_empty!5341 (not b_next!5479) (not b!208899) (not start!20830) (not mapNonEmpty!9080) (not b!208898) b_and!12239)
(check-sat b_and!12239 (not b_next!5479))
