; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20824 () Bool)

(assert start!20824)

(declare-fun b_free!5473 () Bool)

(declare-fun b_next!5473 () Bool)

(assert (=> start!20824 (= b_free!5473 (not b_next!5473))))

(declare-fun tp!19459 () Bool)

(declare-fun b_and!12233 () Bool)

(assert (=> start!20824 (= tp!19459 b_and!12233)))

(declare-fun b!208807 () Bool)

(declare-fun res!101643 () Bool)

(declare-fun e!136131 () Bool)

(assert (=> b!208807 (=> (not res!101643) (not e!136131))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208807 (= res!101643 (validKeyInArray!0 k0!843))))

(declare-fun b!208808 () Bool)

(declare-fun e!136132 () Bool)

(declare-fun tp_is_empty!5335 () Bool)

(assert (=> b!208808 (= e!136132 tp_is_empty!5335)))

(declare-fun b!208809 () Bool)

(assert (=> b!208809 (= e!136131 false)))

(declare-datatypes ((V!6761 0))(
  ( (V!6762 (val!2712 Int)) )
))
(declare-datatypes ((ValueCell!2324 0))(
  ( (ValueCellFull!2324 (v!4683 V!6761)) (EmptyCell!2324) )
))
(declare-datatypes ((array!9865 0))(
  ( (array!9866 (arr!4683 (Array (_ BitVec 32) ValueCell!2324)) (size!5008 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9865)

(declare-datatypes ((tuple2!4044 0))(
  ( (tuple2!4045 (_1!2033 (_ BitVec 64)) (_2!2033 V!6761)) )
))
(declare-datatypes ((List!2932 0))(
  ( (Nil!2929) (Cons!2928 (h!3570 tuple2!4044) (t!7855 List!2932)) )
))
(declare-datatypes ((ListLongMap!2959 0))(
  ( (ListLongMap!2960 (toList!1495 List!2932)) )
))
(declare-fun lt!106909 () ListLongMap!2959)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun v!520 () V!6761)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6761)

(declare-datatypes ((array!9867 0))(
  ( (array!9868 (arr!4684 (Array (_ BitVec 32) (_ BitVec 64))) (size!5009 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9867)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6761)

(declare-fun getCurrentListMapNoExtraKeys!458 (array!9867 array!9865 (_ BitVec 32) (_ BitVec 32) V!6761 V!6761 (_ BitVec 32) Int) ListLongMap!2959)

(assert (=> b!208809 (= lt!106909 (getCurrentListMapNoExtraKeys!458 _keys!825 (array!9866 (store (arr!4683 _values!649) i!601 (ValueCellFull!2324 v!520)) (size!5008 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106910 () ListLongMap!2959)

(assert (=> b!208809 (= lt!106910 (getCurrentListMapNoExtraKeys!458 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208810 () Bool)

(declare-fun res!101642 () Bool)

(assert (=> b!208810 (=> (not res!101642) (not e!136131))))

(declare-datatypes ((List!2933 0))(
  ( (Nil!2930) (Cons!2929 (h!3571 (_ BitVec 64)) (t!7856 List!2933)) )
))
(declare-fun arrayNoDuplicates!0 (array!9867 (_ BitVec 32) List!2933) Bool)

(assert (=> b!208810 (= res!101642 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2930))))

(declare-fun b!208811 () Bool)

(declare-fun res!101647 () Bool)

(assert (=> b!208811 (=> (not res!101647) (not e!136131))))

(assert (=> b!208811 (= res!101647 (and (= (size!5008 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5009 _keys!825) (size!5008 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208812 () Bool)

(declare-fun res!101645 () Bool)

(assert (=> b!208812 (=> (not res!101645) (not e!136131))))

(assert (=> b!208812 (= res!101645 (= (select (arr!4684 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!9071 () Bool)

(declare-fun mapRes!9071 () Bool)

(declare-fun tp!19460 () Bool)

(assert (=> mapNonEmpty!9071 (= mapRes!9071 (and tp!19460 e!136132))))

(declare-fun mapValue!9071 () ValueCell!2324)

(declare-fun mapRest!9071 () (Array (_ BitVec 32) ValueCell!2324))

(declare-fun mapKey!9071 () (_ BitVec 32))

(assert (=> mapNonEmpty!9071 (= (arr!4683 _values!649) (store mapRest!9071 mapKey!9071 mapValue!9071))))

(declare-fun b!208813 () Bool)

(declare-fun res!101641 () Bool)

(assert (=> b!208813 (=> (not res!101641) (not e!136131))))

(assert (=> b!208813 (= res!101641 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5009 _keys!825))))))

(declare-fun mapIsEmpty!9071 () Bool)

(assert (=> mapIsEmpty!9071 mapRes!9071))

(declare-fun b!208815 () Bool)

(declare-fun e!136129 () Bool)

(assert (=> b!208815 (= e!136129 tp_is_empty!5335)))

(declare-fun b!208816 () Bool)

(declare-fun res!101644 () Bool)

(assert (=> b!208816 (=> (not res!101644) (not e!136131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9867 (_ BitVec 32)) Bool)

(assert (=> b!208816 (= res!101644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208814 () Bool)

(declare-fun e!136130 () Bool)

(assert (=> b!208814 (= e!136130 (and e!136129 mapRes!9071))))

(declare-fun condMapEmpty!9071 () Bool)

(declare-fun mapDefault!9071 () ValueCell!2324)

(assert (=> b!208814 (= condMapEmpty!9071 (= (arr!4683 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2324)) mapDefault!9071)))))

(declare-fun res!101646 () Bool)

(assert (=> start!20824 (=> (not res!101646) (not e!136131))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20824 (= res!101646 (validMask!0 mask!1149))))

(assert (=> start!20824 e!136131))

(declare-fun array_inv!3069 (array!9865) Bool)

(assert (=> start!20824 (and (array_inv!3069 _values!649) e!136130)))

(assert (=> start!20824 true))

(assert (=> start!20824 tp_is_empty!5335))

(declare-fun array_inv!3070 (array!9867) Bool)

(assert (=> start!20824 (array_inv!3070 _keys!825)))

(assert (=> start!20824 tp!19459))

(assert (= (and start!20824 res!101646) b!208811))

(assert (= (and b!208811 res!101647) b!208816))

(assert (= (and b!208816 res!101644) b!208810))

(assert (= (and b!208810 res!101642) b!208813))

(assert (= (and b!208813 res!101641) b!208807))

(assert (= (and b!208807 res!101643) b!208812))

(assert (= (and b!208812 res!101645) b!208809))

(assert (= (and b!208814 condMapEmpty!9071) mapIsEmpty!9071))

(assert (= (and b!208814 (not condMapEmpty!9071)) mapNonEmpty!9071))

(get-info :version)

(assert (= (and mapNonEmpty!9071 ((_ is ValueCellFull!2324) mapValue!9071)) b!208808))

(assert (= (and b!208814 ((_ is ValueCellFull!2324) mapDefault!9071)) b!208815))

(assert (= start!20824 b!208814))

(declare-fun m!236487 () Bool)

(assert (=> b!208812 m!236487))

(declare-fun m!236489 () Bool)

(assert (=> start!20824 m!236489))

(declare-fun m!236491 () Bool)

(assert (=> start!20824 m!236491))

(declare-fun m!236493 () Bool)

(assert (=> start!20824 m!236493))

(declare-fun m!236495 () Bool)

(assert (=> b!208816 m!236495))

(declare-fun m!236497 () Bool)

(assert (=> b!208807 m!236497))

(declare-fun m!236499 () Bool)

(assert (=> b!208810 m!236499))

(declare-fun m!236501 () Bool)

(assert (=> b!208809 m!236501))

(declare-fun m!236503 () Bool)

(assert (=> b!208809 m!236503))

(declare-fun m!236505 () Bool)

(assert (=> b!208809 m!236505))

(declare-fun m!236507 () Bool)

(assert (=> mapNonEmpty!9071 m!236507))

(check-sat (not b!208807) (not b_next!5473) tp_is_empty!5335 (not start!20824) (not b!208809) (not b!208816) b_and!12233 (not b!208810) (not mapNonEmpty!9071))
(check-sat b_and!12233 (not b_next!5473))
