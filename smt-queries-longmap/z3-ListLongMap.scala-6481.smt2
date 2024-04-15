; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82708 () Bool)

(assert start!82708)

(declare-fun b_free!18859 () Bool)

(declare-fun b_next!18859 () Bool)

(assert (=> start!82708 (= b_free!18859 (not b_next!18859))))

(declare-fun tp!65698 () Bool)

(declare-fun b_and!30321 () Bool)

(assert (=> start!82708 (= tp!65698 b_and!30321)))

(declare-fun b!964581 () Bool)

(declare-fun res!645710 () Bool)

(declare-fun e!543755 () Bool)

(assert (=> b!964581 (=> (not res!645710) (not e!543755))))

(declare-datatypes ((array!59344 0))(
  ( (array!59345 (arr!28541 (Array (_ BitVec 32) (_ BitVec 64))) (size!29022 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59344)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!964581 (= res!645710 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29022 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29022 _keys!1686))))))

(declare-fun b!964582 () Bool)

(declare-fun res!645714 () Bool)

(assert (=> b!964582 (=> (not res!645714) (not e!543755))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964582 (= res!645714 (validKeyInArray!0 (select (arr!28541 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34486 () Bool)

(declare-fun mapRes!34486 () Bool)

(assert (=> mapIsEmpty!34486 mapRes!34486))

(declare-fun mapNonEmpty!34486 () Bool)

(declare-fun tp!65697 () Bool)

(declare-fun e!543753 () Bool)

(assert (=> mapNonEmpty!34486 (= mapRes!34486 (and tp!65697 e!543753))))

(declare-datatypes ((V!33865 0))(
  ( (V!33866 (val!10881 Int)) )
))
(declare-datatypes ((ValueCell!10349 0))(
  ( (ValueCellFull!10349 (v!13438 V!33865)) (EmptyCell!10349) )
))
(declare-datatypes ((array!59346 0))(
  ( (array!59347 (arr!28542 (Array (_ BitVec 32) ValueCell!10349)) (size!29023 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59346)

(declare-fun mapValue!34486 () ValueCell!10349)

(declare-fun mapKey!34486 () (_ BitVec 32))

(declare-fun mapRest!34486 () (Array (_ BitVec 32) ValueCell!10349))

(assert (=> mapNonEmpty!34486 (= (arr!28542 _values!1400) (store mapRest!34486 mapKey!34486 mapValue!34486))))

(declare-fun b!964583 () Bool)

(declare-fun e!543752 () Bool)

(assert (=> b!964583 (= e!543755 (not e!543752))))

(declare-fun res!645711 () Bool)

(assert (=> b!964583 (=> res!645711 e!543752)))

(assert (=> b!964583 (= res!645711 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29022 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(declare-fun minValue!1342 () V!33865)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33865)

(declare-datatypes ((tuple2!14058 0))(
  ( (tuple2!14059 (_1!7040 (_ BitVec 64)) (_2!7040 V!33865)) )
))
(declare-datatypes ((List!19864 0))(
  ( (Nil!19861) (Cons!19860 (h!21022 tuple2!14058) (t!28218 List!19864)) )
))
(declare-datatypes ((ListLongMap!12745 0))(
  ( (ListLongMap!12746 (toList!6388 List!19864)) )
))
(declare-fun contains!5435 (ListLongMap!12745 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3550 (array!59344 array!59346 (_ BitVec 32) (_ BitVec 32) V!33865 V!33865 (_ BitVec 32) Int) ListLongMap!12745)

(assert (=> b!964583 (contains!5435 (getCurrentListMap!3550 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28541 _keys!1686) i!803))))

(declare-datatypes ((Unit!32162 0))(
  ( (Unit!32163) )
))
(declare-fun lt!430931 () Unit!32162)

(declare-fun lemmaInListMapFromThenInFromMinusOne!45 (array!59344 array!59346 (_ BitVec 32) (_ BitVec 32) V!33865 V!33865 (_ BitVec 32) (_ BitVec 32) Int) Unit!32162)

(assert (=> b!964583 (= lt!430931 (lemmaInListMapFromThenInFromMinusOne!45 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964584 () Bool)

(declare-fun tp_is_empty!21661 () Bool)

(assert (=> b!964584 (= e!543753 tp_is_empty!21661)))

(declare-fun b!964585 () Bool)

(declare-fun res!645715 () Bool)

(assert (=> b!964585 (=> (not res!645715) (not e!543755))))

(declare-datatypes ((List!19865 0))(
  ( (Nil!19862) (Cons!19861 (h!21023 (_ BitVec 64)) (t!28219 List!19865)) )
))
(declare-fun arrayNoDuplicates!0 (array!59344 (_ BitVec 32) List!19865) Bool)

(assert (=> b!964585 (= res!645715 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19862))))

(declare-fun b!964586 () Bool)

(declare-fun res!645709 () Bool)

(assert (=> b!964586 (=> (not res!645709) (not e!543755))))

(assert (=> b!964586 (= res!645709 (bvsgt from!2084 newFrom!159))))

(declare-fun b!964587 () Bool)

(declare-fun res!645712 () Bool)

(assert (=> b!964587 (=> (not res!645712) (not e!543755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59344 (_ BitVec 32)) Bool)

(assert (=> b!964587 (= res!645712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!645716 () Bool)

(assert (=> start!82708 (=> (not res!645716) (not e!543755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82708 (= res!645716 (validMask!0 mask!2110))))

(assert (=> start!82708 e!543755))

(assert (=> start!82708 true))

(declare-fun e!543754 () Bool)

(declare-fun array_inv!22163 (array!59346) Bool)

(assert (=> start!82708 (and (array_inv!22163 _values!1400) e!543754)))

(declare-fun array_inv!22164 (array!59344) Bool)

(assert (=> start!82708 (array_inv!22164 _keys!1686)))

(assert (=> start!82708 tp!65698))

(assert (=> start!82708 tp_is_empty!21661))

(declare-fun b!964588 () Bool)

(declare-fun res!645713 () Bool)

(assert (=> b!964588 (=> (not res!645713) (not e!543755))))

(assert (=> b!964588 (= res!645713 (contains!5435 (getCurrentListMap!3550 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28541 _keys!1686) i!803)))))

(declare-fun b!964589 () Bool)

(declare-fun e!543757 () Bool)

(assert (=> b!964589 (= e!543757 tp_is_empty!21661)))

(declare-fun b!964590 () Bool)

(assert (=> b!964590 (= e!543754 (and e!543757 mapRes!34486))))

(declare-fun condMapEmpty!34486 () Bool)

(declare-fun mapDefault!34486 () ValueCell!10349)

(assert (=> b!964590 (= condMapEmpty!34486 (= (arr!28542 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10349)) mapDefault!34486)))))

(declare-fun b!964591 () Bool)

(declare-fun res!645708 () Bool)

(assert (=> b!964591 (=> (not res!645708) (not e!543755))))

(assert (=> b!964591 (= res!645708 (and (= (size!29023 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29022 _keys!1686) (size!29023 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964592 () Bool)

(assert (=> b!964592 (= e!543752 (bvsle newFrom!159 (size!29022 _keys!1686)))))

(assert (=> b!964592 (contains!5435 (getCurrentListMap!3550 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28541 _keys!1686) i!803))))

(declare-fun lt!430930 () Unit!32162)

(declare-fun lemmaInListMapFromThenInFromSmaller!40 (array!59344 array!59346 (_ BitVec 32) (_ BitVec 32) V!33865 V!33865 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32162)

(assert (=> b!964592 (= lt!430930 (lemmaInListMapFromThenInFromSmaller!40 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(assert (= (and start!82708 res!645716) b!964591))

(assert (= (and b!964591 res!645708) b!964587))

(assert (= (and b!964587 res!645712) b!964585))

(assert (= (and b!964585 res!645715) b!964581))

(assert (= (and b!964581 res!645710) b!964582))

(assert (= (and b!964582 res!645714) b!964588))

(assert (= (and b!964588 res!645713) b!964586))

(assert (= (and b!964586 res!645709) b!964583))

(assert (= (and b!964583 (not res!645711)) b!964592))

(assert (= (and b!964590 condMapEmpty!34486) mapIsEmpty!34486))

(assert (= (and b!964590 (not condMapEmpty!34486)) mapNonEmpty!34486))

(get-info :version)

(assert (= (and mapNonEmpty!34486 ((_ is ValueCellFull!10349) mapValue!34486)) b!964584))

(assert (= (and b!964590 ((_ is ValueCellFull!10349) mapDefault!34486)) b!964589))

(assert (= start!82708 b!964590))

(declare-fun m!893275 () Bool)

(assert (=> b!964583 m!893275))

(declare-fun m!893277 () Bool)

(assert (=> b!964583 m!893277))

(assert (=> b!964583 m!893275))

(assert (=> b!964583 m!893277))

(declare-fun m!893279 () Bool)

(assert (=> b!964583 m!893279))

(declare-fun m!893281 () Bool)

(assert (=> b!964583 m!893281))

(declare-fun m!893283 () Bool)

(assert (=> mapNonEmpty!34486 m!893283))

(declare-fun m!893285 () Bool)

(assert (=> start!82708 m!893285))

(declare-fun m!893287 () Bool)

(assert (=> start!82708 m!893287))

(declare-fun m!893289 () Bool)

(assert (=> start!82708 m!893289))

(declare-fun m!893291 () Bool)

(assert (=> b!964592 m!893291))

(assert (=> b!964592 m!893277))

(assert (=> b!964592 m!893291))

(assert (=> b!964592 m!893277))

(declare-fun m!893293 () Bool)

(assert (=> b!964592 m!893293))

(declare-fun m!893295 () Bool)

(assert (=> b!964592 m!893295))

(declare-fun m!893297 () Bool)

(assert (=> b!964585 m!893297))

(assert (=> b!964582 m!893277))

(assert (=> b!964582 m!893277))

(declare-fun m!893299 () Bool)

(assert (=> b!964582 m!893299))

(declare-fun m!893301 () Bool)

(assert (=> b!964588 m!893301))

(assert (=> b!964588 m!893277))

(assert (=> b!964588 m!893301))

(assert (=> b!964588 m!893277))

(declare-fun m!893303 () Bool)

(assert (=> b!964588 m!893303))

(declare-fun m!893305 () Bool)

(assert (=> b!964587 m!893305))

(check-sat (not b!964582) (not b!964592) (not b!964585) (not b!964587) (not start!82708) (not b!964583) (not b!964588) b_and!30321 tp_is_empty!21661 (not mapNonEmpty!34486) (not b_next!18859))
(check-sat b_and!30321 (not b_next!18859))
