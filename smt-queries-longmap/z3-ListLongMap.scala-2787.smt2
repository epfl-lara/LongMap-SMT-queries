; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40612 () Bool)

(assert start!40612)

(declare-fun b_free!10623 () Bool)

(declare-fun b_next!10623 () Bool)

(assert (=> start!40612 (= b_free!10623 (not b_next!10623))))

(declare-fun tp!37688 () Bool)

(declare-fun b_and!18631 () Bool)

(assert (=> start!40612 (= tp!37688 b_and!18631)))

(declare-fun b!448187 () Bool)

(declare-fun res!266334 () Bool)

(declare-fun e!263028 () Bool)

(assert (=> b!448187 (=> (not res!266334) (not e!263028))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!448187 (= res!266334 (bvsle from!863 i!563))))

(declare-fun b!448188 () Bool)

(assert (=> b!448188 (= e!263028 false)))

(declare-datatypes ((V!17053 0))(
  ( (V!17054 (val!6025 Int)) )
))
(declare-fun minValue!515 () V!17053)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17053)

(declare-datatypes ((tuple2!7902 0))(
  ( (tuple2!7903 (_1!3962 (_ BitVec 64)) (_2!3962 V!17053)) )
))
(declare-datatypes ((List!7967 0))(
  ( (Nil!7964) (Cons!7963 (h!8819 tuple2!7902) (t!13729 List!7967)) )
))
(declare-datatypes ((ListLongMap!6815 0))(
  ( (ListLongMap!6816 (toList!3423 List!7967)) )
))
(declare-fun lt!204116 () ListLongMap!6815)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5637 0))(
  ( (ValueCellFull!5637 (v!8280 V!17053)) (EmptyCell!5637) )
))
(declare-datatypes ((array!27729 0))(
  ( (array!27730 (arr!13310 (Array (_ BitVec 32) ValueCell!5637)) (size!13662 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27729)

(declare-datatypes ((array!27731 0))(
  ( (array!27732 (arr!13311 (Array (_ BitVec 32) (_ BitVec 64))) (size!13663 (_ BitVec 32))) )
))
(declare-fun lt!204117 () array!27731)

(declare-fun v!412 () V!17053)

(declare-fun getCurrentListMapNoExtraKeys!1609 (array!27731 array!27729 (_ BitVec 32) (_ BitVec 32) V!17053 V!17053 (_ BitVec 32) Int) ListLongMap!6815)

(assert (=> b!448188 (= lt!204116 (getCurrentListMapNoExtraKeys!1609 lt!204117 (array!27730 (store (arr!13310 _values!549) i!563 (ValueCellFull!5637 v!412)) (size!13662 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204115 () ListLongMap!6815)

(declare-fun _keys!709 () array!27731)

(assert (=> b!448188 (= lt!204115 (getCurrentListMapNoExtraKeys!1609 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!448189 () Bool)

(declare-fun res!266343 () Bool)

(assert (=> b!448189 (=> (not res!266343) (not e!263028))))

(declare-datatypes ((List!7968 0))(
  ( (Nil!7965) (Cons!7964 (h!8820 (_ BitVec 64)) (t!13730 List!7968)) )
))
(declare-fun arrayNoDuplicates!0 (array!27731 (_ BitVec 32) List!7968) Bool)

(assert (=> b!448189 (= res!266343 (arrayNoDuplicates!0 lt!204117 #b00000000000000000000000000000000 Nil!7965))))

(declare-fun b!448190 () Bool)

(declare-fun res!266336 () Bool)

(declare-fun e!263025 () Bool)

(assert (=> b!448190 (=> (not res!266336) (not e!263025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448190 (= res!266336 (validKeyInArray!0 k0!794))))

(declare-fun b!448192 () Bool)

(declare-fun e!263026 () Bool)

(declare-fun tp_is_empty!11961 () Bool)

(assert (=> b!448192 (= e!263026 tp_is_empty!11961)))

(declare-fun b!448193 () Bool)

(declare-fun res!266338 () Bool)

(assert (=> b!448193 (=> (not res!266338) (not e!263025))))

(assert (=> b!448193 (= res!266338 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7965))))

(declare-fun b!448194 () Bool)

(declare-fun res!266342 () Bool)

(assert (=> b!448194 (=> (not res!266342) (not e!263025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448194 (= res!266342 (validMask!0 mask!1025))))

(declare-fun b!448195 () Bool)

(declare-fun e!263030 () Bool)

(assert (=> b!448195 (= e!263030 tp_is_empty!11961)))

(declare-fun mapNonEmpty!19575 () Bool)

(declare-fun mapRes!19575 () Bool)

(declare-fun tp!37689 () Bool)

(assert (=> mapNonEmpty!19575 (= mapRes!19575 (and tp!37689 e!263026))))

(declare-fun mapValue!19575 () ValueCell!5637)

(declare-fun mapRest!19575 () (Array (_ BitVec 32) ValueCell!5637))

(declare-fun mapKey!19575 () (_ BitVec 32))

(assert (=> mapNonEmpty!19575 (= (arr!13310 _values!549) (store mapRest!19575 mapKey!19575 mapValue!19575))))

(declare-fun b!448196 () Bool)

(declare-fun res!266340 () Bool)

(assert (=> b!448196 (=> (not res!266340) (not e!263025))))

(assert (=> b!448196 (= res!266340 (or (= (select (arr!13311 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13311 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448197 () Bool)

(declare-fun res!266332 () Bool)

(assert (=> b!448197 (=> (not res!266332) (not e!263025))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27731 (_ BitVec 32)) Bool)

(assert (=> b!448197 (= res!266332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!19575 () Bool)

(assert (=> mapIsEmpty!19575 mapRes!19575))

(declare-fun b!448198 () Bool)

(assert (=> b!448198 (= e!263025 e!263028)))

(declare-fun res!266335 () Bool)

(assert (=> b!448198 (=> (not res!266335) (not e!263028))))

(assert (=> b!448198 (= res!266335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204117 mask!1025))))

(assert (=> b!448198 (= lt!204117 (array!27732 (store (arr!13311 _keys!709) i!563 k0!794) (size!13663 _keys!709)))))

(declare-fun b!448199 () Bool)

(declare-fun res!266341 () Bool)

(assert (=> b!448199 (=> (not res!266341) (not e!263025))))

(assert (=> b!448199 (= res!266341 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13663 _keys!709))))))

(declare-fun b!448200 () Bool)

(declare-fun res!266337 () Bool)

(assert (=> b!448200 (=> (not res!266337) (not e!263025))))

(declare-fun arrayContainsKey!0 (array!27731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448200 (= res!266337 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!448201 () Bool)

(declare-fun res!266333 () Bool)

(assert (=> b!448201 (=> (not res!266333) (not e!263025))))

(assert (=> b!448201 (= res!266333 (and (= (size!13662 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13663 _keys!709) (size!13662 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!448191 () Bool)

(declare-fun e!263029 () Bool)

(assert (=> b!448191 (= e!263029 (and e!263030 mapRes!19575))))

(declare-fun condMapEmpty!19575 () Bool)

(declare-fun mapDefault!19575 () ValueCell!5637)

(assert (=> b!448191 (= condMapEmpty!19575 (= (arr!13310 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5637)) mapDefault!19575)))))

(declare-fun res!266339 () Bool)

(assert (=> start!40612 (=> (not res!266339) (not e!263025))))

(assert (=> start!40612 (= res!266339 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13663 _keys!709))))))

(assert (=> start!40612 e!263025))

(assert (=> start!40612 tp_is_empty!11961))

(assert (=> start!40612 tp!37688))

(assert (=> start!40612 true))

(declare-fun array_inv!9644 (array!27729) Bool)

(assert (=> start!40612 (and (array_inv!9644 _values!549) e!263029)))

(declare-fun array_inv!9645 (array!27731) Bool)

(assert (=> start!40612 (array_inv!9645 _keys!709)))

(assert (= (and start!40612 res!266339) b!448194))

(assert (= (and b!448194 res!266342) b!448201))

(assert (= (and b!448201 res!266333) b!448197))

(assert (= (and b!448197 res!266332) b!448193))

(assert (= (and b!448193 res!266338) b!448199))

(assert (= (and b!448199 res!266341) b!448190))

(assert (= (and b!448190 res!266336) b!448196))

(assert (= (and b!448196 res!266340) b!448200))

(assert (= (and b!448200 res!266337) b!448198))

(assert (= (and b!448198 res!266335) b!448189))

(assert (= (and b!448189 res!266343) b!448187))

(assert (= (and b!448187 res!266334) b!448188))

(assert (= (and b!448191 condMapEmpty!19575) mapIsEmpty!19575))

(assert (= (and b!448191 (not condMapEmpty!19575)) mapNonEmpty!19575))

(get-info :version)

(assert (= (and mapNonEmpty!19575 ((_ is ValueCellFull!5637) mapValue!19575)) b!448192))

(assert (= (and b!448191 ((_ is ValueCellFull!5637) mapDefault!19575)) b!448195))

(assert (= start!40612 b!448191))

(declare-fun m!432823 () Bool)

(assert (=> b!448200 m!432823))

(declare-fun m!432825 () Bool)

(assert (=> b!448194 m!432825))

(declare-fun m!432827 () Bool)

(assert (=> b!448197 m!432827))

(declare-fun m!432829 () Bool)

(assert (=> b!448188 m!432829))

(declare-fun m!432831 () Bool)

(assert (=> b!448188 m!432831))

(declare-fun m!432833 () Bool)

(assert (=> b!448188 m!432833))

(declare-fun m!432835 () Bool)

(assert (=> b!448193 m!432835))

(declare-fun m!432837 () Bool)

(assert (=> b!448198 m!432837))

(declare-fun m!432839 () Bool)

(assert (=> b!448198 m!432839))

(declare-fun m!432841 () Bool)

(assert (=> b!448196 m!432841))

(declare-fun m!432843 () Bool)

(assert (=> mapNonEmpty!19575 m!432843))

(declare-fun m!432845 () Bool)

(assert (=> start!40612 m!432845))

(declare-fun m!432847 () Bool)

(assert (=> start!40612 m!432847))

(declare-fun m!432849 () Bool)

(assert (=> b!448189 m!432849))

(declare-fun m!432851 () Bool)

(assert (=> b!448190 m!432851))

(check-sat (not b!448189) (not b!448198) (not b!448190) (not b!448188) (not b!448193) (not start!40612) (not b!448197) tp_is_empty!11961 (not b!448194) (not mapNonEmpty!19575) (not b_next!10623) b_and!18631 (not b!448200))
(check-sat b_and!18631 (not b_next!10623))
