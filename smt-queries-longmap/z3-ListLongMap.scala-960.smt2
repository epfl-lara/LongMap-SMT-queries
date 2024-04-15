; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20860 () Bool)

(assert start!20860)

(declare-fun b_free!5509 () Bool)

(declare-fun b_next!5509 () Bool)

(assert (=> start!20860 (= b_free!5509 (not b_next!5509))))

(declare-fun tp!19567 () Bool)

(declare-fun b_and!12229 () Bool)

(assert (=> start!20860 (= tp!19567 b_and!12229)))

(declare-fun b!209153 () Bool)

(declare-fun e!136276 () Bool)

(declare-fun tp_is_empty!5371 () Bool)

(assert (=> b!209153 (= e!136276 tp_is_empty!5371)))

(declare-fun b!209154 () Bool)

(declare-fun e!136274 () Bool)

(assert (=> b!209154 (= e!136274 tp_is_empty!5371)))

(declare-fun b!209155 () Bool)

(declare-fun res!101907 () Bool)

(declare-fun e!136278 () Bool)

(assert (=> b!209155 (=> (not res!101907) (not e!136278))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9931 0))(
  ( (array!9932 (arr!4715 (Array (_ BitVec 32) (_ BitVec 64))) (size!5041 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9931)

(assert (=> b!209155 (= res!101907 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5041 _keys!825))))))

(declare-fun b!209156 () Bool)

(declare-fun res!101906 () Bool)

(assert (=> b!209156 (=> (not res!101906) (not e!136278))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9931 (_ BitVec 32)) Bool)

(assert (=> b!209156 (= res!101906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!101909 () Bool)

(assert (=> start!20860 (=> (not res!101909) (not e!136278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20860 (= res!101909 (validMask!0 mask!1149))))

(assert (=> start!20860 e!136278))

(declare-datatypes ((V!6809 0))(
  ( (V!6810 (val!2730 Int)) )
))
(declare-datatypes ((ValueCell!2342 0))(
  ( (ValueCellFull!2342 (v!4694 V!6809)) (EmptyCell!2342) )
))
(declare-datatypes ((array!9933 0))(
  ( (array!9934 (arr!4716 (Array (_ BitVec 32) ValueCell!2342)) (size!5042 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9933)

(declare-fun e!136277 () Bool)

(declare-fun array_inv!3097 (array!9933) Bool)

(assert (=> start!20860 (and (array_inv!3097 _values!649) e!136277)))

(assert (=> start!20860 true))

(assert (=> start!20860 tp_is_empty!5371))

(declare-fun array_inv!3098 (array!9931) Bool)

(assert (=> start!20860 (array_inv!3098 _keys!825)))

(assert (=> start!20860 tp!19567))

(declare-fun b!209157 () Bool)

(declare-fun res!101903 () Bool)

(assert (=> b!209157 (=> (not res!101903) (not e!136278))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209157 (= res!101903 (validKeyInArray!0 k0!843))))

(declare-fun b!209158 () Bool)

(declare-fun res!101908 () Bool)

(assert (=> b!209158 (=> (not res!101908) (not e!136278))))

(assert (=> b!209158 (= res!101908 (= (select (arr!4715 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!9125 () Bool)

(declare-fun mapRes!9125 () Bool)

(assert (=> mapIsEmpty!9125 mapRes!9125))

(declare-fun mapNonEmpty!9125 () Bool)

(declare-fun tp!19568 () Bool)

(assert (=> mapNonEmpty!9125 (= mapRes!9125 (and tp!19568 e!136274))))

(declare-fun mapKey!9125 () (_ BitVec 32))

(declare-fun mapValue!9125 () ValueCell!2342)

(declare-fun mapRest!9125 () (Array (_ BitVec 32) ValueCell!2342))

(assert (=> mapNonEmpty!9125 (= (arr!4716 _values!649) (store mapRest!9125 mapKey!9125 mapValue!9125))))

(declare-fun b!209159 () Bool)

(declare-datatypes ((tuple2!4110 0))(
  ( (tuple2!4111 (_1!2066 (_ BitVec 64)) (_2!2066 V!6809)) )
))
(declare-datatypes ((List!3017 0))(
  ( (Nil!3014) (Cons!3013 (h!3655 tuple2!4110) (t!7939 List!3017)) )
))
(declare-datatypes ((ListLongMap!3013 0))(
  ( (ListLongMap!3014 (toList!1522 List!3017)) )
))
(declare-fun lt!106782 () ListLongMap!3013)

(declare-fun lt!106783 () ListLongMap!3013)

(assert (=> b!209159 (= e!136278 (not (= lt!106782 lt!106783)))))

(assert (=> b!209159 (= lt!106783 lt!106782)))

(declare-fun v!520 () V!6809)

(declare-fun lt!106784 () ListLongMap!3013)

(declare-fun +!546 (ListLongMap!3013 tuple2!4110) ListLongMap!3013)

(assert (=> b!209159 (= lt!106782 (+!546 lt!106784 (tuple2!4111 k0!843 v!520)))))

(declare-datatypes ((Unit!6332 0))(
  ( (Unit!6333) )
))
(declare-fun lt!106781 () Unit!6332)

(declare-fun zeroValue!615 () V!6809)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6809)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!197 (array!9931 array!9933 (_ BitVec 32) (_ BitVec 32) V!6809 V!6809 (_ BitVec 32) (_ BitVec 64) V!6809 (_ BitVec 32) Int) Unit!6332)

(assert (=> b!209159 (= lt!106781 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!197 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!473 (array!9931 array!9933 (_ BitVec 32) (_ BitVec 32) V!6809 V!6809 (_ BitVec 32) Int) ListLongMap!3013)

(assert (=> b!209159 (= lt!106783 (getCurrentListMapNoExtraKeys!473 _keys!825 (array!9934 (store (arr!4716 _values!649) i!601 (ValueCellFull!2342 v!520)) (size!5042 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!209159 (= lt!106784 (getCurrentListMapNoExtraKeys!473 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209160 () Bool)

(assert (=> b!209160 (= e!136277 (and e!136276 mapRes!9125))))

(declare-fun condMapEmpty!9125 () Bool)

(declare-fun mapDefault!9125 () ValueCell!2342)

(assert (=> b!209160 (= condMapEmpty!9125 (= (arr!4716 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2342)) mapDefault!9125)))))

(declare-fun b!209161 () Bool)

(declare-fun res!101905 () Bool)

(assert (=> b!209161 (=> (not res!101905) (not e!136278))))

(declare-datatypes ((List!3018 0))(
  ( (Nil!3015) (Cons!3014 (h!3656 (_ BitVec 64)) (t!7940 List!3018)) )
))
(declare-fun arrayNoDuplicates!0 (array!9931 (_ BitVec 32) List!3018) Bool)

(assert (=> b!209161 (= res!101905 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3015))))

(declare-fun b!209162 () Bool)

(declare-fun res!101904 () Bool)

(assert (=> b!209162 (=> (not res!101904) (not e!136278))))

(assert (=> b!209162 (= res!101904 (and (= (size!5042 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5041 _keys!825) (size!5042 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20860 res!101909) b!209162))

(assert (= (and b!209162 res!101904) b!209156))

(assert (= (and b!209156 res!101906) b!209161))

(assert (= (and b!209161 res!101905) b!209155))

(assert (= (and b!209155 res!101907) b!209157))

(assert (= (and b!209157 res!101903) b!209158))

(assert (= (and b!209158 res!101908) b!209159))

(assert (= (and b!209160 condMapEmpty!9125) mapIsEmpty!9125))

(assert (= (and b!209160 (not condMapEmpty!9125)) mapNonEmpty!9125))

(get-info :version)

(assert (= (and mapNonEmpty!9125 ((_ is ValueCellFull!2342) mapValue!9125)) b!209154))

(assert (= (and b!209160 ((_ is ValueCellFull!2342) mapDefault!9125)) b!209153))

(assert (= start!20860 b!209160))

(declare-fun m!236085 () Bool)

(assert (=> b!209156 m!236085))

(declare-fun m!236087 () Bool)

(assert (=> b!209159 m!236087))

(declare-fun m!236089 () Bool)

(assert (=> b!209159 m!236089))

(declare-fun m!236091 () Bool)

(assert (=> b!209159 m!236091))

(declare-fun m!236093 () Bool)

(assert (=> b!209159 m!236093))

(declare-fun m!236095 () Bool)

(assert (=> b!209159 m!236095))

(declare-fun m!236097 () Bool)

(assert (=> b!209161 m!236097))

(declare-fun m!236099 () Bool)

(assert (=> mapNonEmpty!9125 m!236099))

(declare-fun m!236101 () Bool)

(assert (=> b!209158 m!236101))

(declare-fun m!236103 () Bool)

(assert (=> start!20860 m!236103))

(declare-fun m!236105 () Bool)

(assert (=> start!20860 m!236105))

(declare-fun m!236107 () Bool)

(assert (=> start!20860 m!236107))

(declare-fun m!236109 () Bool)

(assert (=> b!209157 m!236109))

(check-sat (not b!209157) b_and!12229 (not b_next!5509) (not start!20860) (not mapNonEmpty!9125) (not b!209156) (not b!209161) tp_is_empty!5371 (not b!209159))
(check-sat b_and!12229 (not b_next!5509))
