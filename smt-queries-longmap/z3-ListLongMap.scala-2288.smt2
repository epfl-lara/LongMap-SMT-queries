; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37192 () Bool)

(assert start!37192)

(declare-fun b_free!8319 () Bool)

(declare-fun b_next!8319 () Bool)

(assert (=> start!37192 (= b_free!8319 (not b_next!8319))))

(declare-fun tp!29672 () Bool)

(declare-fun b_and!15561 () Bool)

(assert (=> start!37192 (= tp!29672 b_and!15561)))

(declare-fun b!375612 () Bool)

(declare-fun res!212091 () Bool)

(declare-fun e!228830 () Bool)

(assert (=> b!375612 (=> (not res!212091) (not e!228830))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375612 (= res!212091 (validKeyInArray!0 k0!778))))

(declare-fun b!375613 () Bool)

(declare-fun e!228827 () Bool)

(declare-fun tp_is_empty!8967 () Bool)

(assert (=> b!375613 (= e!228827 tp_is_empty!8967)))

(declare-fun res!212083 () Bool)

(assert (=> start!37192 (=> (not res!212083) (not e!228830))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37192 (= res!212083 (validMask!0 mask!970))))

(assert (=> start!37192 e!228830))

(declare-datatypes ((V!13061 0))(
  ( (V!13062 (val!4528 Int)) )
))
(declare-datatypes ((ValueCell!4140 0))(
  ( (ValueCellFull!4140 (v!6725 V!13061)) (EmptyCell!4140) )
))
(declare-datatypes ((array!21869 0))(
  ( (array!21870 (arr!10403 (Array (_ BitVec 32) ValueCell!4140)) (size!10755 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21869)

(declare-fun e!228823 () Bool)

(declare-fun array_inv!7670 (array!21869) Bool)

(assert (=> start!37192 (and (array_inv!7670 _values!506) e!228823)))

(assert (=> start!37192 tp!29672))

(assert (=> start!37192 true))

(assert (=> start!37192 tp_is_empty!8967))

(declare-datatypes ((array!21871 0))(
  ( (array!21872 (arr!10404 (Array (_ BitVec 32) (_ BitVec 64))) (size!10756 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21871)

(declare-fun array_inv!7671 (array!21871) Bool)

(assert (=> start!37192 (array_inv!7671 _keys!658)))

(declare-fun b!375614 () Bool)

(declare-fun e!228826 () Bool)

(declare-fun e!228828 () Bool)

(assert (=> b!375614 (= e!228826 e!228828)))

(declare-fun res!212090 () Bool)

(assert (=> b!375614 (=> res!212090 e!228828)))

(assert (=> b!375614 (= res!212090 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6026 0))(
  ( (tuple2!6027 (_1!3024 (_ BitVec 64)) (_2!3024 V!13061)) )
))
(declare-datatypes ((List!5868 0))(
  ( (Nil!5865) (Cons!5864 (h!6720 tuple2!6026) (t!11018 List!5868)) )
))
(declare-datatypes ((ListLongMap!4939 0))(
  ( (ListLongMap!4940 (toList!2485 List!5868)) )
))
(declare-fun lt!173951 () ListLongMap!4939)

(declare-fun lt!173948 () ListLongMap!4939)

(assert (=> b!375614 (= lt!173951 lt!173948)))

(declare-fun lt!173952 () ListLongMap!4939)

(declare-fun lt!173943 () tuple2!6026)

(declare-fun +!831 (ListLongMap!4939 tuple2!6026) ListLongMap!4939)

(assert (=> b!375614 (= lt!173948 (+!831 lt!173952 lt!173943))))

(declare-fun v!373 () V!13061)

(declare-fun lt!173953 () ListLongMap!4939)

(declare-fun zeroValue!472 () V!13061)

(declare-datatypes ((Unit!11568 0))(
  ( (Unit!11569) )
))
(declare-fun lt!173945 () Unit!11568)

(declare-fun addCommutativeForDiffKeys!250 (ListLongMap!4939 (_ BitVec 64) V!13061 (_ BitVec 64) V!13061) Unit!11568)

(assert (=> b!375614 (= lt!173945 (addCommutativeForDiffKeys!250 lt!173953 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!173949 () ListLongMap!4939)

(declare-fun lt!173940 () tuple2!6026)

(assert (=> b!375614 (= lt!173949 (+!831 lt!173951 lt!173940))))

(declare-fun lt!173944 () ListLongMap!4939)

(declare-fun lt!173950 () tuple2!6026)

(assert (=> b!375614 (= lt!173951 (+!831 lt!173944 lt!173950))))

(declare-fun lt!173941 () ListLongMap!4939)

(declare-fun lt!173955 () ListLongMap!4939)

(assert (=> b!375614 (= lt!173941 lt!173955)))

(assert (=> b!375614 (= lt!173955 (+!831 lt!173952 lt!173940))))

(assert (=> b!375614 (= lt!173952 (+!831 lt!173953 lt!173950))))

(declare-fun lt!173942 () ListLongMap!4939)

(assert (=> b!375614 (= lt!173949 (+!831 (+!831 lt!173942 lt!173950) lt!173940))))

(declare-fun minValue!472 () V!13061)

(assert (=> b!375614 (= lt!173940 (tuple2!6027 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!375614 (= lt!173950 (tuple2!6027 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375615 () Bool)

(declare-fun res!212082 () Bool)

(assert (=> b!375615 (=> (not res!212082) (not e!228830))))

(declare-fun arrayContainsKey!0 (array!21871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375615 (= res!212082 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!375616 () Bool)

(declare-fun res!212093 () Bool)

(assert (=> b!375616 (=> (not res!212093) (not e!228830))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!375616 (= res!212093 (and (= (size!10755 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10756 _keys!658) (size!10755 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!375617 () Bool)

(declare-fun res!212088 () Bool)

(assert (=> b!375617 (=> (not res!212088) (not e!228830))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!375617 (= res!212088 (or (= (select (arr!10404 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10404 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15015 () Bool)

(declare-fun mapRes!15015 () Bool)

(assert (=> mapIsEmpty!15015 mapRes!15015))

(declare-fun b!375618 () Bool)

(declare-fun e!228825 () Bool)

(assert (=> b!375618 (= e!228830 e!228825)))

(declare-fun res!212085 () Bool)

(assert (=> b!375618 (=> (not res!212085) (not e!228825))))

(declare-fun lt!173954 () array!21871)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21871 (_ BitVec 32)) Bool)

(assert (=> b!375618 (= res!212085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173954 mask!970))))

(assert (=> b!375618 (= lt!173954 (array!21872 (store (arr!10404 _keys!658) i!548 k0!778) (size!10756 _keys!658)))))

(declare-fun b!375619 () Bool)

(declare-fun res!212086 () Bool)

(assert (=> b!375619 (=> (not res!212086) (not e!228830))))

(assert (=> b!375619 (= res!212086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!375620 () Bool)

(declare-fun res!212089 () Bool)

(assert (=> b!375620 (=> (not res!212089) (not e!228825))))

(declare-datatypes ((List!5869 0))(
  ( (Nil!5866) (Cons!5865 (h!6721 (_ BitVec 64)) (t!11019 List!5869)) )
))
(declare-fun arrayNoDuplicates!0 (array!21871 (_ BitVec 32) List!5869) Bool)

(assert (=> b!375620 (= res!212089 (arrayNoDuplicates!0 lt!173954 #b00000000000000000000000000000000 Nil!5866))))

(declare-fun b!375621 () Bool)

(declare-fun e!228829 () Bool)

(assert (=> b!375621 (= e!228829 tp_is_empty!8967)))

(declare-fun b!375622 () Bool)

(declare-fun res!212087 () Bool)

(assert (=> b!375622 (=> (not res!212087) (not e!228830))))

(assert (=> b!375622 (= res!212087 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10756 _keys!658))))))

(declare-fun b!375623 () Bool)

(assert (=> b!375623 (= e!228828 (bvsle #b00000000000000000000000000000000 (size!10756 _keys!658)))))

(assert (=> b!375623 (= (+!831 lt!173948 lt!173940) (+!831 lt!173955 lt!173943))))

(declare-fun lt!173939 () Unit!11568)

(assert (=> b!375623 (= lt!173939 (addCommutativeForDiffKeys!250 lt!173952 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!375624 () Bool)

(assert (=> b!375624 (= e!228823 (and e!228829 mapRes!15015))))

(declare-fun condMapEmpty!15015 () Bool)

(declare-fun mapDefault!15015 () ValueCell!4140)

(assert (=> b!375624 (= condMapEmpty!15015 (= (arr!10403 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4140)) mapDefault!15015)))))

(declare-fun b!375625 () Bool)

(assert (=> b!375625 (= e!228825 (not e!228826))))

(declare-fun res!212084 () Bool)

(assert (=> b!375625 (=> res!212084 e!228826)))

(assert (=> b!375625 (= res!212084 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1920 (array!21871 array!21869 (_ BitVec 32) (_ BitVec 32) V!13061 V!13061 (_ BitVec 32) Int) ListLongMap!4939)

(assert (=> b!375625 (= lt!173941 (getCurrentListMap!1920 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173947 () array!21869)

(assert (=> b!375625 (= lt!173949 (getCurrentListMap!1920 lt!173954 lt!173947 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375625 (and (= lt!173942 lt!173944) (= lt!173944 lt!173942))))

(assert (=> b!375625 (= lt!173944 (+!831 lt!173953 lt!173943))))

(assert (=> b!375625 (= lt!173943 (tuple2!6027 k0!778 v!373))))

(declare-fun lt!173946 () Unit!11568)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!78 (array!21871 array!21869 (_ BitVec 32) (_ BitVec 32) V!13061 V!13061 (_ BitVec 32) (_ BitVec 64) V!13061 (_ BitVec 32) Int) Unit!11568)

(assert (=> b!375625 (= lt!173946 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!78 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!754 (array!21871 array!21869 (_ BitVec 32) (_ BitVec 32) V!13061 V!13061 (_ BitVec 32) Int) ListLongMap!4939)

(assert (=> b!375625 (= lt!173942 (getCurrentListMapNoExtraKeys!754 lt!173954 lt!173947 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375625 (= lt!173947 (array!21870 (store (arr!10403 _values!506) i!548 (ValueCellFull!4140 v!373)) (size!10755 _values!506)))))

(assert (=> b!375625 (= lt!173953 (getCurrentListMapNoExtraKeys!754 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!375626 () Bool)

(declare-fun res!212092 () Bool)

(assert (=> b!375626 (=> (not res!212092) (not e!228830))))

(assert (=> b!375626 (= res!212092 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5866))))

(declare-fun mapNonEmpty!15015 () Bool)

(declare-fun tp!29673 () Bool)

(assert (=> mapNonEmpty!15015 (= mapRes!15015 (and tp!29673 e!228827))))

(declare-fun mapRest!15015 () (Array (_ BitVec 32) ValueCell!4140))

(declare-fun mapValue!15015 () ValueCell!4140)

(declare-fun mapKey!15015 () (_ BitVec 32))

(assert (=> mapNonEmpty!15015 (= (arr!10403 _values!506) (store mapRest!15015 mapKey!15015 mapValue!15015))))

(assert (= (and start!37192 res!212083) b!375616))

(assert (= (and b!375616 res!212093) b!375619))

(assert (= (and b!375619 res!212086) b!375626))

(assert (= (and b!375626 res!212092) b!375622))

(assert (= (and b!375622 res!212087) b!375612))

(assert (= (and b!375612 res!212091) b!375617))

(assert (= (and b!375617 res!212088) b!375615))

(assert (= (and b!375615 res!212082) b!375618))

(assert (= (and b!375618 res!212085) b!375620))

(assert (= (and b!375620 res!212089) b!375625))

(assert (= (and b!375625 (not res!212084)) b!375614))

(assert (= (and b!375614 (not res!212090)) b!375623))

(assert (= (and b!375624 condMapEmpty!15015) mapIsEmpty!15015))

(assert (= (and b!375624 (not condMapEmpty!15015)) mapNonEmpty!15015))

(get-info :version)

(assert (= (and mapNonEmpty!15015 ((_ is ValueCellFull!4140) mapValue!15015)) b!375613))

(assert (= (and b!375624 ((_ is ValueCellFull!4140) mapDefault!15015)) b!375621))

(assert (= start!37192 b!375624))

(declare-fun m!372255 () Bool)

(assert (=> start!37192 m!372255))

(declare-fun m!372257 () Bool)

(assert (=> start!37192 m!372257))

(declare-fun m!372259 () Bool)

(assert (=> start!37192 m!372259))

(declare-fun m!372261 () Bool)

(assert (=> b!375626 m!372261))

(declare-fun m!372263 () Bool)

(assert (=> b!375625 m!372263))

(declare-fun m!372265 () Bool)

(assert (=> b!375625 m!372265))

(declare-fun m!372267 () Bool)

(assert (=> b!375625 m!372267))

(declare-fun m!372269 () Bool)

(assert (=> b!375625 m!372269))

(declare-fun m!372271 () Bool)

(assert (=> b!375625 m!372271))

(declare-fun m!372273 () Bool)

(assert (=> b!375625 m!372273))

(declare-fun m!372275 () Bool)

(assert (=> b!375625 m!372275))

(declare-fun m!372277 () Bool)

(assert (=> b!375618 m!372277))

(declare-fun m!372279 () Bool)

(assert (=> b!375618 m!372279))

(declare-fun m!372281 () Bool)

(assert (=> mapNonEmpty!15015 m!372281))

(declare-fun m!372283 () Bool)

(assert (=> b!375617 m!372283))

(declare-fun m!372285 () Bool)

(assert (=> b!375614 m!372285))

(declare-fun m!372287 () Bool)

(assert (=> b!375614 m!372287))

(declare-fun m!372289 () Bool)

(assert (=> b!375614 m!372289))

(declare-fun m!372291 () Bool)

(assert (=> b!375614 m!372291))

(declare-fun m!372293 () Bool)

(assert (=> b!375614 m!372293))

(declare-fun m!372295 () Bool)

(assert (=> b!375614 m!372295))

(declare-fun m!372297 () Bool)

(assert (=> b!375614 m!372297))

(assert (=> b!375614 m!372287))

(declare-fun m!372299 () Bool)

(assert (=> b!375614 m!372299))

(declare-fun m!372301 () Bool)

(assert (=> b!375623 m!372301))

(declare-fun m!372303 () Bool)

(assert (=> b!375623 m!372303))

(declare-fun m!372305 () Bool)

(assert (=> b!375623 m!372305))

(declare-fun m!372307 () Bool)

(assert (=> b!375612 m!372307))

(declare-fun m!372309 () Bool)

(assert (=> b!375619 m!372309))

(declare-fun m!372311 () Bool)

(assert (=> b!375620 m!372311))

(declare-fun m!372313 () Bool)

(assert (=> b!375615 m!372313))

(check-sat (not b!375620) (not b!375618) (not b!375626) (not b!375612) (not b!375625) (not start!37192) (not mapNonEmpty!15015) b_and!15561 (not b!375615) (not b_next!8319) (not b!375623) tp_is_empty!8967 (not b!375619) (not b!375614))
(check-sat b_and!15561 (not b_next!8319))
