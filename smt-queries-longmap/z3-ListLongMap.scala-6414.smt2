; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82282 () Bool)

(assert start!82282)

(declare-fun b_free!18555 () Bool)

(declare-fun b_next!18555 () Bool)

(assert (=> start!82282 (= b_free!18555 (not b_next!18555))))

(declare-fun tp!64625 () Bool)

(declare-fun b_and!30043 () Bool)

(assert (=> start!82282 (= tp!64625 b_and!30043)))

(declare-fun b!959212 () Bool)

(declare-fun e!540734 () Bool)

(declare-fun e!540731 () Bool)

(declare-fun mapRes!33871 () Bool)

(assert (=> b!959212 (= e!540734 (and e!540731 mapRes!33871))))

(declare-fun condMapEmpty!33871 () Bool)

(declare-datatypes ((V!33331 0))(
  ( (V!33332 (val!10681 Int)) )
))
(declare-datatypes ((ValueCell!10149 0))(
  ( (ValueCellFull!10149 (v!13238 V!33331)) (EmptyCell!10149) )
))
(declare-datatypes ((array!58619 0))(
  ( (array!58620 (arr!28183 (Array (_ BitVec 32) ValueCell!10149)) (size!28662 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58619)

(declare-fun mapDefault!33871 () ValueCell!10149)

(assert (=> b!959212 (= condMapEmpty!33871 (= (arr!28183 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10149)) mapDefault!33871)))))

(declare-fun b!959213 () Bool)

(declare-fun res!642075 () Bool)

(declare-fun e!540732 () Bool)

(assert (=> b!959213 (=> (not res!642075) (not e!540732))))

(declare-datatypes ((array!58621 0))(
  ( (array!58622 (arr!28184 (Array (_ BitVec 32) (_ BitVec 64))) (size!28663 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58621)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959213 (= res!642075 (validKeyInArray!0 (select (arr!28184 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!33871 () Bool)

(declare-fun tp!64626 () Bool)

(declare-fun e!540735 () Bool)

(assert (=> mapNonEmpty!33871 (= mapRes!33871 (and tp!64626 e!540735))))

(declare-fun mapKey!33871 () (_ BitVec 32))

(declare-fun mapValue!33871 () ValueCell!10149)

(declare-fun mapRest!33871 () (Array (_ BitVec 32) ValueCell!10149))

(assert (=> mapNonEmpty!33871 (= (arr!28183 _values!1386) (store mapRest!33871 mapKey!33871 mapValue!33871))))

(declare-fun b!959214 () Bool)

(declare-fun res!642080 () Bool)

(assert (=> b!959214 (=> (not res!642080) (not e!540732))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun minValue!1328 () V!33331)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun zeroValue!1328 () V!33331)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun defaultEntry!1389 () Int)

(declare-datatypes ((tuple2!13778 0))(
  ( (tuple2!13779 (_1!6900 (_ BitVec 64)) (_2!6900 V!33331)) )
))
(declare-datatypes ((List!19596 0))(
  ( (Nil!19593) (Cons!19592 (h!20754 tuple2!13778) (t!27959 List!19596)) )
))
(declare-datatypes ((ListLongMap!12475 0))(
  ( (ListLongMap!12476 (toList!6253 List!19596)) )
))
(declare-fun contains!5354 (ListLongMap!12475 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3486 (array!58621 array!58619 (_ BitVec 32) (_ BitVec 32) V!33331 V!33331 (_ BitVec 32) Int) ListLongMap!12475)

(assert (=> b!959214 (= res!642080 (contains!5354 (getCurrentListMap!3486 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28184 _keys!1668) i!793)))))

(declare-fun b!959215 () Bool)

(declare-fun res!642078 () Bool)

(assert (=> b!959215 (=> (not res!642078) (not e!540732))))

(assert (=> b!959215 (= res!642078 (and (= (size!28662 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28663 _keys!1668) (size!28662 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun res!642074 () Bool)

(assert (=> start!82282 (=> (not res!642074) (not e!540732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82282 (= res!642074 (validMask!0 mask!2088))))

(assert (=> start!82282 e!540732))

(assert (=> start!82282 true))

(declare-fun tp_is_empty!21261 () Bool)

(assert (=> start!82282 tp_is_empty!21261))

(declare-fun array_inv!21849 (array!58621) Bool)

(assert (=> start!82282 (array_inv!21849 _keys!1668)))

(declare-fun array_inv!21850 (array!58619) Bool)

(assert (=> start!82282 (and (array_inv!21850 _values!1386) e!540734)))

(assert (=> start!82282 tp!64625))

(declare-fun b!959216 () Bool)

(declare-fun res!642076 () Bool)

(assert (=> b!959216 (=> (not res!642076) (not e!540732))))

(declare-datatypes ((List!19597 0))(
  ( (Nil!19594) (Cons!19593 (h!20755 (_ BitVec 64)) (t!27960 List!19597)) )
))
(declare-fun arrayNoDuplicates!0 (array!58621 (_ BitVec 32) List!19597) Bool)

(assert (=> b!959216 (= res!642076 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19594))))

(declare-fun b!959217 () Bool)

(assert (=> b!959217 (= e!540732 (not true))))

(assert (=> b!959217 (contains!5354 (getCurrentListMap!3486 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28184 _keys!1668) i!793))))

(declare-datatypes ((Unit!32181 0))(
  ( (Unit!32182) )
))
(declare-fun lt!430524 () Unit!32181)

(declare-fun lemmaInListMapFromThenInFromSmaller!12 (array!58621 array!58619 (_ BitVec 32) (_ BitVec 32) V!33331 V!33331 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32181)

(assert (=> b!959217 (= lt!430524 (lemmaInListMapFromThenInFromSmaller!12 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!959218 () Bool)

(declare-fun res!642079 () Bool)

(assert (=> b!959218 (=> (not res!642079) (not e!540732))))

(assert (=> b!959218 (= res!642079 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28663 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28663 _keys!1668))))))

(declare-fun b!959219 () Bool)

(assert (=> b!959219 (= e!540731 tp_is_empty!21261)))

(declare-fun b!959220 () Bool)

(declare-fun res!642077 () Bool)

(assert (=> b!959220 (=> (not res!642077) (not e!540732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58621 (_ BitVec 32)) Bool)

(assert (=> b!959220 (= res!642077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapIsEmpty!33871 () Bool)

(assert (=> mapIsEmpty!33871 mapRes!33871))

(declare-fun b!959221 () Bool)

(assert (=> b!959221 (= e!540735 tp_is_empty!21261)))

(assert (= (and start!82282 res!642074) b!959215))

(assert (= (and b!959215 res!642078) b!959220))

(assert (= (and b!959220 res!642077) b!959216))

(assert (= (and b!959216 res!642076) b!959218))

(assert (= (and b!959218 res!642079) b!959213))

(assert (= (and b!959213 res!642075) b!959214))

(assert (= (and b!959214 res!642080) b!959217))

(assert (= (and b!959212 condMapEmpty!33871) mapIsEmpty!33871))

(assert (= (and b!959212 (not condMapEmpty!33871)) mapNonEmpty!33871))

(get-info :version)

(assert (= (and mapNonEmpty!33871 ((_ is ValueCellFull!10149) mapValue!33871)) b!959221))

(assert (= (and b!959212 ((_ is ValueCellFull!10149) mapDefault!33871)) b!959219))

(assert (= start!82282 b!959212))

(declare-fun m!889735 () Bool)

(assert (=> b!959213 m!889735))

(assert (=> b!959213 m!889735))

(declare-fun m!889737 () Bool)

(assert (=> b!959213 m!889737))

(declare-fun m!889739 () Bool)

(assert (=> b!959217 m!889739))

(assert (=> b!959217 m!889735))

(assert (=> b!959217 m!889739))

(assert (=> b!959217 m!889735))

(declare-fun m!889741 () Bool)

(assert (=> b!959217 m!889741))

(declare-fun m!889743 () Bool)

(assert (=> b!959217 m!889743))

(declare-fun m!889745 () Bool)

(assert (=> b!959214 m!889745))

(assert (=> b!959214 m!889735))

(assert (=> b!959214 m!889745))

(assert (=> b!959214 m!889735))

(declare-fun m!889747 () Bool)

(assert (=> b!959214 m!889747))

(declare-fun m!889749 () Bool)

(assert (=> b!959220 m!889749))

(declare-fun m!889751 () Bool)

(assert (=> b!959216 m!889751))

(declare-fun m!889753 () Bool)

(assert (=> start!82282 m!889753))

(declare-fun m!889755 () Bool)

(assert (=> start!82282 m!889755))

(declare-fun m!889757 () Bool)

(assert (=> start!82282 m!889757))

(declare-fun m!889759 () Bool)

(assert (=> mapNonEmpty!33871 m!889759))

(check-sat (not b!959213) (not mapNonEmpty!33871) b_and!30043 tp_is_empty!21261 (not b!959216) (not start!82282) (not b!959214) (not b_next!18555) (not b!959220) (not b!959217))
(check-sat b_and!30043 (not b_next!18555))
