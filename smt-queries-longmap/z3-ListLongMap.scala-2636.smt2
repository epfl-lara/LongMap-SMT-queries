; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39620 () Bool)

(assert start!39620)

(declare-fun b_free!9901 () Bool)

(declare-fun b_next!9901 () Bool)

(assert (=> start!39620 (= b_free!9901 (not b_next!9901))))

(declare-fun tp!35231 () Bool)

(declare-fun b_and!17571 () Bool)

(assert (=> start!39620 (= tp!35231 b_and!17571)))

(declare-fun b!424990 () Bool)

(declare-fun e!252358 () Bool)

(declare-fun e!252356 () Bool)

(declare-fun mapRes!18201 () Bool)

(assert (=> b!424990 (= e!252358 (and e!252356 mapRes!18201))))

(declare-fun condMapEmpty!18201 () Bool)

(declare-datatypes ((V!15843 0))(
  ( (V!15844 (val!5571 Int)) )
))
(declare-datatypes ((ValueCell!5183 0))(
  ( (ValueCellFull!5183 (v!7819 V!15843)) (EmptyCell!5183) )
))
(declare-datatypes ((array!25952 0))(
  ( (array!25953 (arr!12425 (Array (_ BitVec 32) ValueCell!5183)) (size!12777 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25952)

(declare-fun mapDefault!18201 () ValueCell!5183)

(assert (=> b!424990 (= condMapEmpty!18201 (= (arr!12425 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5183)) mapDefault!18201)))))

(declare-fun b!424991 () Bool)

(declare-fun e!252355 () Bool)

(declare-fun e!252360 () Bool)

(assert (=> b!424991 (= e!252355 e!252360)))

(declare-fun res!248763 () Bool)

(assert (=> b!424991 (=> (not res!248763) (not e!252360))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424991 (= res!248763 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!15843)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7208 0))(
  ( (tuple2!7209 (_1!3615 (_ BitVec 64)) (_2!3615 V!15843)) )
))
(declare-datatypes ((List!7216 0))(
  ( (Nil!7213) (Cons!7212 (h!8068 tuple2!7208) (t!12652 List!7216)) )
))
(declare-datatypes ((ListLongMap!6123 0))(
  ( (ListLongMap!6124 (toList!3077 List!7216)) )
))
(declare-fun lt!194546 () ListLongMap!6123)

(declare-fun zeroValue!515 () V!15843)

(declare-fun lt!194545 () array!25952)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!25954 0))(
  ( (array!25955 (arr!12426 (Array (_ BitVec 32) (_ BitVec 64))) (size!12778 (_ BitVec 32))) )
))
(declare-fun lt!194547 () array!25954)

(declare-fun getCurrentListMapNoExtraKeys!1323 (array!25954 array!25952 (_ BitVec 32) (_ BitVec 32) V!15843 V!15843 (_ BitVec 32) Int) ListLongMap!6123)

(assert (=> b!424991 (= lt!194546 (getCurrentListMapNoExtraKeys!1323 lt!194547 lt!194545 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15843)

(assert (=> b!424991 (= lt!194545 (array!25953 (store (arr!12425 _values!549) i!563 (ValueCellFull!5183 v!412)) (size!12777 _values!549)))))

(declare-fun lt!194543 () ListLongMap!6123)

(declare-fun _keys!709 () array!25954)

(assert (=> b!424991 (= lt!194543 (getCurrentListMapNoExtraKeys!1323 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!424992 () Bool)

(declare-fun res!248768 () Bool)

(declare-fun e!252361 () Bool)

(assert (=> b!424992 (=> (not res!248768) (not e!252361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25954 (_ BitVec 32)) Bool)

(assert (=> b!424992 (= res!248768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!18201 () Bool)

(assert (=> mapIsEmpty!18201 mapRes!18201))

(declare-fun b!424993 () Bool)

(declare-fun res!248760 () Bool)

(assert (=> b!424993 (=> (not res!248760) (not e!252355))))

(declare-datatypes ((List!7217 0))(
  ( (Nil!7214) (Cons!7213 (h!8069 (_ BitVec 64)) (t!12653 List!7217)) )
))
(declare-fun arrayNoDuplicates!0 (array!25954 (_ BitVec 32) List!7217) Bool)

(assert (=> b!424993 (= res!248760 (arrayNoDuplicates!0 lt!194547 #b00000000000000000000000000000000 Nil!7214))))

(declare-fun res!248767 () Bool)

(assert (=> start!39620 (=> (not res!248767) (not e!252361))))

(assert (=> start!39620 (= res!248767 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12778 _keys!709))))))

(assert (=> start!39620 e!252361))

(declare-fun tp_is_empty!11053 () Bool)

(assert (=> start!39620 tp_is_empty!11053))

(assert (=> start!39620 tp!35231))

(assert (=> start!39620 true))

(declare-fun array_inv!9128 (array!25952) Bool)

(assert (=> start!39620 (and (array_inv!9128 _values!549) e!252358)))

(declare-fun array_inv!9129 (array!25954) Bool)

(assert (=> start!39620 (array_inv!9129 _keys!709)))

(declare-fun b!424994 () Bool)

(declare-fun e!252359 () Bool)

(assert (=> b!424994 (= e!252359 tp_is_empty!11053)))

(declare-fun b!424995 () Bool)

(declare-fun res!248758 () Bool)

(assert (=> b!424995 (=> (not res!248758) (not e!252361))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424995 (= res!248758 (validKeyInArray!0 k0!794))))

(declare-fun b!424996 () Bool)

(declare-fun res!248757 () Bool)

(assert (=> b!424996 (=> (not res!248757) (not e!252355))))

(assert (=> b!424996 (= res!248757 (bvsle from!863 i!563))))

(declare-fun b!424997 () Bool)

(declare-fun res!248766 () Bool)

(assert (=> b!424997 (=> (not res!248766) (not e!252361))))

(declare-fun arrayContainsKey!0 (array!25954 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424997 (= res!248766 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!424998 () Bool)

(declare-fun res!248762 () Bool)

(assert (=> b!424998 (=> (not res!248762) (not e!252361))))

(assert (=> b!424998 (= res!248762 (or (= (select (arr!12426 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12426 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!424999 () Bool)

(declare-fun res!248761 () Bool)

(assert (=> b!424999 (=> (not res!248761) (not e!252361))))

(assert (=> b!424999 (= res!248761 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7214))))

(declare-fun b!425000 () Bool)

(declare-fun res!248759 () Bool)

(assert (=> b!425000 (=> (not res!248759) (not e!252361))))

(assert (=> b!425000 (= res!248759 (and (= (size!12777 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12778 _keys!709) (size!12777 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!425001 () Bool)

(declare-fun res!248769 () Bool)

(assert (=> b!425001 (=> (not res!248769) (not e!252361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425001 (= res!248769 (validMask!0 mask!1025))))

(declare-fun b!425002 () Bool)

(assert (=> b!425002 (= e!252356 tp_is_empty!11053)))

(declare-fun mapNonEmpty!18201 () Bool)

(declare-fun tp!35232 () Bool)

(assert (=> mapNonEmpty!18201 (= mapRes!18201 (and tp!35232 e!252359))))

(declare-fun mapValue!18201 () ValueCell!5183)

(declare-fun mapRest!18201 () (Array (_ BitVec 32) ValueCell!5183))

(declare-fun mapKey!18201 () (_ BitVec 32))

(assert (=> mapNonEmpty!18201 (= (arr!12425 _values!549) (store mapRest!18201 mapKey!18201 mapValue!18201))))

(declare-fun b!425003 () Bool)

(assert (=> b!425003 (= e!252360 (not true))))

(declare-fun +!1296 (ListLongMap!6123 tuple2!7208) ListLongMap!6123)

(assert (=> b!425003 (= (getCurrentListMapNoExtraKeys!1323 lt!194547 lt!194545 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1296 (getCurrentListMapNoExtraKeys!1323 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7209 k0!794 v!412)))))

(declare-datatypes ((Unit!12467 0))(
  ( (Unit!12468) )
))
(declare-fun lt!194544 () Unit!12467)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!480 (array!25954 array!25952 (_ BitVec 32) (_ BitVec 32) V!15843 V!15843 (_ BitVec 32) (_ BitVec 64) V!15843 (_ BitVec 32) Int) Unit!12467)

(assert (=> b!425003 (= lt!194544 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!480 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!425004 () Bool)

(declare-fun res!248765 () Bool)

(assert (=> b!425004 (=> (not res!248765) (not e!252361))))

(assert (=> b!425004 (= res!248765 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12778 _keys!709))))))

(declare-fun b!425005 () Bool)

(assert (=> b!425005 (= e!252361 e!252355)))

(declare-fun res!248764 () Bool)

(assert (=> b!425005 (=> (not res!248764) (not e!252355))))

(assert (=> b!425005 (= res!248764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194547 mask!1025))))

(assert (=> b!425005 (= lt!194547 (array!25955 (store (arr!12426 _keys!709) i!563 k0!794) (size!12778 _keys!709)))))

(assert (= (and start!39620 res!248767) b!425001))

(assert (= (and b!425001 res!248769) b!425000))

(assert (= (and b!425000 res!248759) b!424992))

(assert (= (and b!424992 res!248768) b!424999))

(assert (= (and b!424999 res!248761) b!425004))

(assert (= (and b!425004 res!248765) b!424995))

(assert (= (and b!424995 res!248758) b!424998))

(assert (= (and b!424998 res!248762) b!424997))

(assert (= (and b!424997 res!248766) b!425005))

(assert (= (and b!425005 res!248764) b!424993))

(assert (= (and b!424993 res!248760) b!424996))

(assert (= (and b!424996 res!248757) b!424991))

(assert (= (and b!424991 res!248763) b!425003))

(assert (= (and b!424990 condMapEmpty!18201) mapIsEmpty!18201))

(assert (= (and b!424990 (not condMapEmpty!18201)) mapNonEmpty!18201))

(get-info :version)

(assert (= (and mapNonEmpty!18201 ((_ is ValueCellFull!5183) mapValue!18201)) b!424994))

(assert (= (and b!424990 ((_ is ValueCellFull!5183) mapDefault!18201)) b!425002))

(assert (= start!39620 b!424990))

(declare-fun m!414239 () Bool)

(assert (=> b!425005 m!414239))

(declare-fun m!414241 () Bool)

(assert (=> b!425005 m!414241))

(declare-fun m!414243 () Bool)

(assert (=> b!424993 m!414243))

(declare-fun m!414245 () Bool)

(assert (=> b!424995 m!414245))

(declare-fun m!414247 () Bool)

(assert (=> b!424997 m!414247))

(declare-fun m!414249 () Bool)

(assert (=> b!424991 m!414249))

(declare-fun m!414251 () Bool)

(assert (=> b!424991 m!414251))

(declare-fun m!414253 () Bool)

(assert (=> b!424991 m!414253))

(declare-fun m!414255 () Bool)

(assert (=> b!424999 m!414255))

(declare-fun m!414257 () Bool)

(assert (=> b!425001 m!414257))

(declare-fun m!414259 () Bool)

(assert (=> b!424992 m!414259))

(declare-fun m!414261 () Bool)

(assert (=> b!425003 m!414261))

(declare-fun m!414263 () Bool)

(assert (=> b!425003 m!414263))

(assert (=> b!425003 m!414263))

(declare-fun m!414265 () Bool)

(assert (=> b!425003 m!414265))

(declare-fun m!414267 () Bool)

(assert (=> b!425003 m!414267))

(declare-fun m!414269 () Bool)

(assert (=> b!424998 m!414269))

(declare-fun m!414271 () Bool)

(assert (=> mapNonEmpty!18201 m!414271))

(declare-fun m!414273 () Bool)

(assert (=> start!39620 m!414273))

(declare-fun m!414275 () Bool)

(assert (=> start!39620 m!414275))

(check-sat (not b!424992) (not b_next!9901) (not b!424991) b_and!17571 (not b!425001) (not b!424997) tp_is_empty!11053 (not b!425005) (not b!424999) (not b!424993) (not b!425003) (not mapNonEmpty!18201) (not b!424995) (not start!39620))
(check-sat b_and!17571 (not b_next!9901))
