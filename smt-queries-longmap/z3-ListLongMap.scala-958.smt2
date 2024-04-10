; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20846 () Bool)

(assert start!20846)

(declare-fun b_free!5499 () Bool)

(declare-fun b_next!5499 () Bool)

(assert (=> start!20846 (= b_free!5499 (not b_next!5499))))

(declare-fun tp!19538 () Bool)

(declare-fun b_and!12245 () Bool)

(assert (=> start!20846 (= tp!19538 b_and!12245)))

(declare-fun res!101896 () Bool)

(declare-fun e!136300 () Bool)

(assert (=> start!20846 (=> (not res!101896) (not e!136300))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20846 (= res!101896 (validMask!0 mask!1149))))

(assert (=> start!20846 e!136300))

(declare-datatypes ((V!6795 0))(
  ( (V!6796 (val!2725 Int)) )
))
(declare-datatypes ((ValueCell!2337 0))(
  ( (ValueCellFull!2337 (v!4695 V!6795)) (EmptyCell!2337) )
))
(declare-datatypes ((array!9921 0))(
  ( (array!9922 (arr!4711 (Array (_ BitVec 32) ValueCell!2337)) (size!5036 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9921)

(declare-fun e!136303 () Bool)

(declare-fun array_inv!3121 (array!9921) Bool)

(assert (=> start!20846 (and (array_inv!3121 _values!649) e!136303)))

(assert (=> start!20846 true))

(declare-fun tp_is_empty!5361 () Bool)

(assert (=> start!20846 tp_is_empty!5361))

(declare-datatypes ((array!9923 0))(
  ( (array!9924 (arr!4712 (Array (_ BitVec 32) (_ BitVec 64))) (size!5037 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9923)

(declare-fun array_inv!3122 (array!9923) Bool)

(assert (=> start!20846 (array_inv!3122 _keys!825)))

(assert (=> start!20846 tp!19538))

(declare-fun b!209150 () Bool)

(declare-fun res!101895 () Bool)

(assert (=> b!209150 (=> (not res!101895) (not e!136300))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!209150 (= res!101895 (= (select (arr!4712 _keys!825) i!601) k0!843))))

(declare-fun b!209151 () Bool)

(declare-fun e!136301 () Bool)

(assert (=> b!209151 (= e!136301 tp_is_empty!5361)))

(declare-fun b!209152 () Bool)

(declare-fun res!101897 () Bool)

(assert (=> b!209152 (=> (not res!101897) (not e!136300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9923 (_ BitVec 32)) Bool)

(assert (=> b!209152 (= res!101897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!209153 () Bool)

(declare-fun res!101899 () Bool)

(assert (=> b!209153 (=> (not res!101899) (not e!136300))))

(assert (=> b!209153 (= res!101899 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5037 _keys!825))))))

(declare-fun b!209154 () Bool)

(declare-fun e!136302 () Bool)

(assert (=> b!209154 (= e!136302 tp_is_empty!5361)))

(declare-fun b!209155 () Bool)

(declare-fun res!101893 () Bool)

(assert (=> b!209155 (=> (not res!101893) (not e!136300))))

(declare-datatypes ((List!3015 0))(
  ( (Nil!3012) (Cons!3011 (h!3653 (_ BitVec 64)) (t!7946 List!3015)) )
))
(declare-fun arrayNoDuplicates!0 (array!9923 (_ BitVec 32) List!3015) Bool)

(assert (=> b!209155 (= res!101893 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3012))))

(declare-fun b!209156 () Bool)

(assert (=> b!209156 (= e!136300 false)))

(declare-datatypes ((tuple2!4120 0))(
  ( (tuple2!4121 (_1!2071 (_ BitVec 64)) (_2!2071 V!6795)) )
))
(declare-datatypes ((List!3016 0))(
  ( (Nil!3013) (Cons!3012 (h!3654 tuple2!4120) (t!7947 List!3016)) )
))
(declare-datatypes ((ListLongMap!3033 0))(
  ( (ListLongMap!3034 (toList!1532 List!3016)) )
))
(declare-fun lt!106929 () ListLongMap!3033)

(declare-fun v!520 () V!6795)

(declare-fun zeroValue!615 () V!6795)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6795)

(declare-fun getCurrentListMapNoExtraKeys!473 (array!9923 array!9921 (_ BitVec 32) (_ BitVec 32) V!6795 V!6795 (_ BitVec 32) Int) ListLongMap!3033)

(assert (=> b!209156 (= lt!106929 (getCurrentListMapNoExtraKeys!473 _keys!825 (array!9922 (store (arr!4711 _values!649) i!601 (ValueCellFull!2337 v!520)) (size!5036 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106928 () ListLongMap!3033)

(assert (=> b!209156 (= lt!106928 (getCurrentListMapNoExtraKeys!473 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!9110 () Bool)

(declare-fun mapRes!9110 () Bool)

(assert (=> mapIsEmpty!9110 mapRes!9110))

(declare-fun b!209157 () Bool)

(assert (=> b!209157 (= e!136303 (and e!136302 mapRes!9110))))

(declare-fun condMapEmpty!9110 () Bool)

(declare-fun mapDefault!9110 () ValueCell!2337)

(assert (=> b!209157 (= condMapEmpty!9110 (= (arr!4711 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2337)) mapDefault!9110)))))

(declare-fun mapNonEmpty!9110 () Bool)

(declare-fun tp!19537 () Bool)

(assert (=> mapNonEmpty!9110 (= mapRes!9110 (and tp!19537 e!136301))))

(declare-fun mapRest!9110 () (Array (_ BitVec 32) ValueCell!2337))

(declare-fun mapKey!9110 () (_ BitVec 32))

(declare-fun mapValue!9110 () ValueCell!2337)

(assert (=> mapNonEmpty!9110 (= (arr!4711 _values!649) (store mapRest!9110 mapKey!9110 mapValue!9110))))

(declare-fun b!209158 () Bool)

(declare-fun res!101898 () Bool)

(assert (=> b!209158 (=> (not res!101898) (not e!136300))))

(assert (=> b!209158 (= res!101898 (and (= (size!5036 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5037 _keys!825) (size!5036 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!209159 () Bool)

(declare-fun res!101894 () Bool)

(assert (=> b!209159 (=> (not res!101894) (not e!136300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209159 (= res!101894 (validKeyInArray!0 k0!843))))

(assert (= (and start!20846 res!101896) b!209158))

(assert (= (and b!209158 res!101898) b!209152))

(assert (= (and b!209152 res!101897) b!209155))

(assert (= (and b!209155 res!101893) b!209153))

(assert (= (and b!209153 res!101899) b!209159))

(assert (= (and b!209159 res!101894) b!209150))

(assert (= (and b!209150 res!101895) b!209156))

(assert (= (and b!209157 condMapEmpty!9110) mapIsEmpty!9110))

(assert (= (and b!209157 (not condMapEmpty!9110)) mapNonEmpty!9110))

(get-info :version)

(assert (= (and mapNonEmpty!9110 ((_ is ValueCellFull!2337) mapValue!9110)) b!209151))

(assert (= (and b!209157 ((_ is ValueCellFull!2337) mapDefault!9110)) b!209154))

(assert (= start!20846 b!209157))

(declare-fun m!236591 () Bool)

(assert (=> b!209156 m!236591))

(declare-fun m!236593 () Bool)

(assert (=> b!209156 m!236593))

(declare-fun m!236595 () Bool)

(assert (=> b!209156 m!236595))

(declare-fun m!236597 () Bool)

(assert (=> mapNonEmpty!9110 m!236597))

(declare-fun m!236599 () Bool)

(assert (=> b!209150 m!236599))

(declare-fun m!236601 () Bool)

(assert (=> b!209159 m!236601))

(declare-fun m!236603 () Bool)

(assert (=> start!20846 m!236603))

(declare-fun m!236605 () Bool)

(assert (=> start!20846 m!236605))

(declare-fun m!236607 () Bool)

(assert (=> start!20846 m!236607))

(declare-fun m!236609 () Bool)

(assert (=> b!209155 m!236609))

(declare-fun m!236611 () Bool)

(assert (=> b!209152 m!236611))

(check-sat (not b!209156) (not start!20846) (not b!209159) (not mapNonEmpty!9110) (not b_next!5499) (not b!209152) b_and!12245 tp_is_empty!5361 (not b!209155))
(check-sat b_and!12245 (not b_next!5499))
