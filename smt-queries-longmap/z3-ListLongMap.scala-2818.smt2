; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40874 () Bool)

(assert start!40874)

(declare-fun b_free!10809 () Bool)

(declare-fun b_next!10809 () Bool)

(assert (=> start!40874 (= b_free!10809 (not b_next!10809))))

(declare-fun tp!38254 () Bool)

(declare-fun b_and!18951 () Bool)

(assert (=> start!40874 (= tp!38254 b_and!18951)))

(declare-fun b!453827 () Bool)

(declare-fun res!270276 () Bool)

(declare-fun e!265636 () Bool)

(assert (=> b!453827 (=> (not res!270276) (not e!265636))))

(declare-datatypes ((array!28101 0))(
  ( (array!28102 (arr!13494 (Array (_ BitVec 32) (_ BitVec 64))) (size!13846 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28101)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28101 (_ BitVec 32)) Bool)

(assert (=> b!453827 (= res!270276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!19861 () Bool)

(declare-fun mapRes!19861 () Bool)

(assert (=> mapIsEmpty!19861 mapRes!19861))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun e!265634 () Bool)

(declare-fun b!453828 () Bool)

(assert (=> b!453828 (= e!265634 (and (not (= from!863 i!563)) (bvslt from!863 i!563) (or (bvslt (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!863) (size!13846 _keys!709)))))))

(declare-datatypes ((V!17301 0))(
  ( (V!17302 (val!6118 Int)) )
))
(declare-fun minValue!515 () V!17301)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5730 0))(
  ( (ValueCellFull!5730 (v!8384 V!17301)) (EmptyCell!5730) )
))
(declare-datatypes ((array!28103 0))(
  ( (array!28104 (arr!13495 (Array (_ BitVec 32) ValueCell!5730)) (size!13847 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28103)

(declare-fun zeroValue!515 () V!17301)

(declare-fun lt!206014 () array!28101)

(declare-datatypes ((tuple2!8060 0))(
  ( (tuple2!8061 (_1!4041 (_ BitVec 64)) (_2!4041 V!17301)) )
))
(declare-datatypes ((List!8117 0))(
  ( (Nil!8114) (Cons!8113 (h!8969 tuple2!8060) (t!13945 List!8117)) )
))
(declare-datatypes ((ListLongMap!6973 0))(
  ( (ListLongMap!6974 (toList!3502 List!8117)) )
))
(declare-fun lt!206013 () ListLongMap!6973)

(declare-fun v!412 () V!17301)

(declare-fun getCurrentListMapNoExtraKeys!1685 (array!28101 array!28103 (_ BitVec 32) (_ BitVec 32) V!17301 V!17301 (_ BitVec 32) Int) ListLongMap!6973)

(assert (=> b!453828 (= lt!206013 (getCurrentListMapNoExtraKeys!1685 lt!206014 (array!28104 (store (arr!13495 _values!549) i!563 (ValueCellFull!5730 v!412)) (size!13847 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206015 () ListLongMap!6973)

(assert (=> b!453828 (= lt!206015 (getCurrentListMapNoExtraKeys!1685 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!453829 () Bool)

(declare-fun res!270286 () Bool)

(assert (=> b!453829 (=> (not res!270286) (not e!265636))))

(assert (=> b!453829 (= res!270286 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13846 _keys!709))))))

(declare-fun b!453830 () Bool)

(declare-fun res!270279 () Bool)

(assert (=> b!453830 (=> (not res!270279) (not e!265636))))

(declare-datatypes ((List!8118 0))(
  ( (Nil!8115) (Cons!8114 (h!8970 (_ BitVec 64)) (t!13946 List!8118)) )
))
(declare-fun arrayNoDuplicates!0 (array!28101 (_ BitVec 32) List!8118) Bool)

(assert (=> b!453830 (= res!270279 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8115))))

(declare-fun b!453831 () Bool)

(declare-fun res!270285 () Bool)

(assert (=> b!453831 (=> (not res!270285) (not e!265636))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!453831 (= res!270285 (validKeyInArray!0 k0!794))))

(declare-fun b!453832 () Bool)

(declare-fun e!265639 () Bool)

(declare-fun tp_is_empty!12147 () Bool)

(assert (=> b!453832 (= e!265639 tp_is_empty!12147)))

(declare-fun b!453833 () Bool)

(declare-fun e!265638 () Bool)

(assert (=> b!453833 (= e!265638 (and e!265639 mapRes!19861))))

(declare-fun condMapEmpty!19861 () Bool)

(declare-fun mapDefault!19861 () ValueCell!5730)

(assert (=> b!453833 (= condMapEmpty!19861 (= (arr!13495 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5730)) mapDefault!19861)))))

(declare-fun b!453834 () Bool)

(assert (=> b!453834 (= e!265636 e!265634)))

(declare-fun res!270281 () Bool)

(assert (=> b!453834 (=> (not res!270281) (not e!265634))))

(assert (=> b!453834 (= res!270281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206014 mask!1025))))

(assert (=> b!453834 (= lt!206014 (array!28102 (store (arr!13494 _keys!709) i!563 k0!794) (size!13846 _keys!709)))))

(declare-fun mapNonEmpty!19861 () Bool)

(declare-fun tp!38253 () Bool)

(declare-fun e!265635 () Bool)

(assert (=> mapNonEmpty!19861 (= mapRes!19861 (and tp!38253 e!265635))))

(declare-fun mapValue!19861 () ValueCell!5730)

(declare-fun mapKey!19861 () (_ BitVec 32))

(declare-fun mapRest!19861 () (Array (_ BitVec 32) ValueCell!5730))

(assert (=> mapNonEmpty!19861 (= (arr!13495 _values!549) (store mapRest!19861 mapKey!19861 mapValue!19861))))

(declare-fun b!453835 () Bool)

(declare-fun res!270277 () Bool)

(assert (=> b!453835 (=> (not res!270277) (not e!265636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!453835 (= res!270277 (validMask!0 mask!1025))))

(declare-fun b!453836 () Bool)

(declare-fun res!270280 () Bool)

(assert (=> b!453836 (=> (not res!270280) (not e!265636))))

(assert (=> b!453836 (= res!270280 (or (= (select (arr!13494 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13494 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453837 () Bool)

(assert (=> b!453837 (= e!265635 tp_is_empty!12147)))

(declare-fun b!453838 () Bool)

(declare-fun res!270287 () Bool)

(assert (=> b!453838 (=> (not res!270287) (not e!265636))))

(assert (=> b!453838 (= res!270287 (and (= (size!13847 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13846 _keys!709) (size!13847 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!453839 () Bool)

(declare-fun res!270282 () Bool)

(assert (=> b!453839 (=> (not res!270282) (not e!265634))))

(assert (=> b!453839 (= res!270282 (bvsle from!863 i!563))))

(declare-fun res!270284 () Bool)

(assert (=> start!40874 (=> (not res!270284) (not e!265636))))

(assert (=> start!40874 (= res!270284 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13846 _keys!709))))))

(assert (=> start!40874 e!265636))

(assert (=> start!40874 tp_is_empty!12147))

(assert (=> start!40874 tp!38254))

(assert (=> start!40874 true))

(declare-fun array_inv!9774 (array!28103) Bool)

(assert (=> start!40874 (and (array_inv!9774 _values!549) e!265638)))

(declare-fun array_inv!9775 (array!28101) Bool)

(assert (=> start!40874 (array_inv!9775 _keys!709)))

(declare-fun b!453840 () Bool)

(declare-fun res!270278 () Bool)

(assert (=> b!453840 (=> (not res!270278) (not e!265634))))

(assert (=> b!453840 (= res!270278 (arrayNoDuplicates!0 lt!206014 #b00000000000000000000000000000000 Nil!8115))))

(declare-fun b!453841 () Bool)

(declare-fun res!270283 () Bool)

(assert (=> b!453841 (=> (not res!270283) (not e!265636))))

(declare-fun arrayContainsKey!0 (array!28101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!453841 (= res!270283 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!40874 res!270284) b!453835))

(assert (= (and b!453835 res!270277) b!453838))

(assert (= (and b!453838 res!270287) b!453827))

(assert (= (and b!453827 res!270276) b!453830))

(assert (= (and b!453830 res!270279) b!453829))

(assert (= (and b!453829 res!270286) b!453831))

(assert (= (and b!453831 res!270285) b!453836))

(assert (= (and b!453836 res!270280) b!453841))

(assert (= (and b!453841 res!270283) b!453834))

(assert (= (and b!453834 res!270281) b!453840))

(assert (= (and b!453840 res!270278) b!453839))

(assert (= (and b!453839 res!270282) b!453828))

(assert (= (and b!453833 condMapEmpty!19861) mapIsEmpty!19861))

(assert (= (and b!453833 (not condMapEmpty!19861)) mapNonEmpty!19861))

(get-info :version)

(assert (= (and mapNonEmpty!19861 ((_ is ValueCellFull!5730) mapValue!19861)) b!453837))

(assert (= (and b!453833 ((_ is ValueCellFull!5730) mapDefault!19861)) b!453832))

(assert (= start!40874 b!453833))

(declare-fun m!438151 () Bool)

(assert (=> b!453840 m!438151))

(declare-fun m!438153 () Bool)

(assert (=> b!453831 m!438153))

(declare-fun m!438155 () Bool)

(assert (=> start!40874 m!438155))

(declare-fun m!438157 () Bool)

(assert (=> start!40874 m!438157))

(declare-fun m!438159 () Bool)

(assert (=> b!453828 m!438159))

(declare-fun m!438161 () Bool)

(assert (=> b!453828 m!438161))

(declare-fun m!438163 () Bool)

(assert (=> b!453828 m!438163))

(declare-fun m!438165 () Bool)

(assert (=> mapNonEmpty!19861 m!438165))

(declare-fun m!438167 () Bool)

(assert (=> b!453830 m!438167))

(declare-fun m!438169 () Bool)

(assert (=> b!453827 m!438169))

(declare-fun m!438171 () Bool)

(assert (=> b!453834 m!438171))

(declare-fun m!438173 () Bool)

(assert (=> b!453834 m!438173))

(declare-fun m!438175 () Bool)

(assert (=> b!453841 m!438175))

(declare-fun m!438177 () Bool)

(assert (=> b!453835 m!438177))

(declare-fun m!438179 () Bool)

(assert (=> b!453836 m!438179))

(check-sat (not b_next!10809) b_and!18951 (not b!453828) (not b!453827) (not b!453834) (not mapNonEmpty!19861) (not b!453840) (not b!453841) tp_is_empty!12147 (not b!453831) (not b!453835) (not b!453830) (not start!40874))
(check-sat b_and!18951 (not b_next!10809))
