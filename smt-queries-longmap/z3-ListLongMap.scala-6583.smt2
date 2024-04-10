; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83384 () Bool)

(assert start!83384)

(declare-fun b_free!19377 () Bool)

(declare-fun b_next!19377 () Bool)

(assert (=> start!83384 (= b_free!19377 (not b_next!19377))))

(declare-fun tp!67409 () Bool)

(declare-fun b_and!30975 () Bool)

(assert (=> start!83384 (= tp!67409 b_and!30975)))

(declare-fun b!973736 () Bool)

(declare-fun e!548872 () Bool)

(declare-fun from!2118 () (_ BitVec 32))

(declare-datatypes ((array!60591 0))(
  ( (array!60592 (arr!29159 (Array (_ BitVec 32) (_ BitVec 64))) (size!29638 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60591)

(assert (=> b!973736 (= e!548872 (not (bvsle (bvsub from!2118 #b00000000000000000000000000000001) (size!29638 _keys!1717))))))

(declare-datatypes ((V!34683 0))(
  ( (V!34684 (val!11188 Int)) )
))
(declare-datatypes ((tuple2!14370 0))(
  ( (tuple2!14371 (_1!7196 (_ BitVec 64)) (_2!7196 V!34683)) )
))
(declare-fun lt!432681 () tuple2!14370)

(declare-datatypes ((List!20228 0))(
  ( (Nil!20225) (Cons!20224 (h!21386 tuple2!14370) (t!28703 List!20228)) )
))
(declare-datatypes ((ListLongMap!13067 0))(
  ( (ListLongMap!13068 (toList!6549 List!20228)) )
))
(declare-fun lt!432682 () ListLongMap!13067)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5640 (ListLongMap!13067 (_ BitVec 64)) Bool)

(declare-fun +!2913 (ListLongMap!13067 tuple2!14370) ListLongMap!13067)

(assert (=> b!973736 (contains!5640 (+!2913 lt!432682 lt!432681) (select (arr!29159 _keys!1717) i!822))))

(declare-fun lt!432677 () (_ BitVec 64))

(declare-fun lt!432683 () V!34683)

(declare-datatypes ((Unit!32447 0))(
  ( (Unit!32448) )
))
(declare-fun lt!432679 () Unit!32447)

(declare-fun addStillContains!609 (ListLongMap!13067 (_ BitVec 64) V!34683 (_ BitVec 64)) Unit!32447)

(assert (=> b!973736 (= lt!432679 (addStillContains!609 lt!432682 lt!432677 lt!432683 (select (arr!29159 _keys!1717) i!822)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10656 0))(
  ( (ValueCellFull!10656 (v!13747 V!34683)) (EmptyCell!10656) )
))
(declare-datatypes ((array!60593 0))(
  ( (array!60594 (arr!29160 (Array (_ BitVec 32) ValueCell!10656)) (size!29639 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60593)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34683)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun lt!432680 () ListLongMap!13067)

(declare-fun zeroValue!1367 () V!34683)

(declare-fun getCurrentListMap!3782 (array!60591 array!60593 (_ BitVec 32) (_ BitVec 32) V!34683 V!34683 (_ BitVec 32) Int) ListLongMap!13067)

(assert (=> b!973736 (= lt!432680 (+!2913 (getCurrentListMap!3782 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432681))))

(assert (=> b!973736 (= lt!432681 (tuple2!14371 lt!432677 lt!432683))))

(declare-fun get!15118 (ValueCell!10656 V!34683) V!34683)

(declare-fun dynLambda!1702 (Int (_ BitVec 64)) V!34683)

(assert (=> b!973736 (= lt!432683 (get!15118 (select (arr!29160 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1702 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432678 () Unit!32447)

(declare-fun lemmaListMapRecursiveValidKeyArray!279 (array!60591 array!60593 (_ BitVec 32) (_ BitVec 32) V!34683 V!34683 (_ BitVec 32) Int) Unit!32447)

(assert (=> b!973736 (= lt!432678 (lemmaListMapRecursiveValidKeyArray!279 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35422 () Bool)

(declare-fun mapRes!35422 () Bool)

(declare-fun tp!67410 () Bool)

(declare-fun e!548869 () Bool)

(assert (=> mapNonEmpty!35422 (= mapRes!35422 (and tp!67410 e!548869))))

(declare-fun mapKey!35422 () (_ BitVec 32))

(declare-fun mapValue!35422 () ValueCell!10656)

(declare-fun mapRest!35422 () (Array (_ BitVec 32) ValueCell!10656))

(assert (=> mapNonEmpty!35422 (= (arr!29160 _values!1425) (store mapRest!35422 mapKey!35422 mapValue!35422))))

(declare-fun b!973737 () Bool)

(declare-fun e!548874 () Bool)

(declare-fun e!548871 () Bool)

(assert (=> b!973737 (= e!548874 e!548871)))

(declare-fun res!651802 () Bool)

(assert (=> b!973737 (=> (not res!651802) (not e!548871))))

(assert (=> b!973737 (= res!651802 (contains!5640 lt!432682 (select (arr!29159 _keys!1717) i!822)))))

(assert (=> b!973737 (= lt!432682 (getCurrentListMap!3782 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!973738 () Bool)

(declare-fun res!651797 () Bool)

(assert (=> b!973738 (=> (not res!651797) (not e!548874))))

(assert (=> b!973738 (= res!651797 (and (= (size!29639 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29638 _keys!1717) (size!29639 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973739 () Bool)

(assert (=> b!973739 (= e!548871 e!548872)))

(declare-fun res!651804 () Bool)

(assert (=> b!973739 (=> (not res!651804) (not e!548872))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973739 (= res!651804 (validKeyInArray!0 lt!432677))))

(assert (=> b!973739 (= lt!432677 (select (arr!29159 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!973739 (= lt!432680 (getCurrentListMap!3782 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973740 () Bool)

(declare-fun res!651801 () Bool)

(assert (=> b!973740 (=> (not res!651801) (not e!548874))))

(assert (=> b!973740 (= res!651801 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29638 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29638 _keys!1717))))))

(declare-fun mapIsEmpty!35422 () Bool)

(assert (=> mapIsEmpty!35422 mapRes!35422))

(declare-fun b!973741 () Bool)

(declare-fun res!651800 () Bool)

(assert (=> b!973741 (=> (not res!651800) (not e!548874))))

(assert (=> b!973741 (= res!651800 (validKeyInArray!0 (select (arr!29159 _keys!1717) i!822)))))

(declare-fun b!973742 () Bool)

(declare-fun res!651803 () Bool)

(assert (=> b!973742 (=> (not res!651803) (not e!548874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60591 (_ BitVec 32)) Bool)

(assert (=> b!973742 (= res!651803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973743 () Bool)

(declare-fun tp_is_empty!22275 () Bool)

(assert (=> b!973743 (= e!548869 tp_is_empty!22275)))

(declare-fun res!651799 () Bool)

(assert (=> start!83384 (=> (not res!651799) (not e!548874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83384 (= res!651799 (validMask!0 mask!2147))))

(assert (=> start!83384 e!548874))

(assert (=> start!83384 true))

(declare-fun e!548870 () Bool)

(declare-fun array_inv!22555 (array!60593) Bool)

(assert (=> start!83384 (and (array_inv!22555 _values!1425) e!548870)))

(assert (=> start!83384 tp_is_empty!22275))

(assert (=> start!83384 tp!67409))

(declare-fun array_inv!22556 (array!60591) Bool)

(assert (=> start!83384 (array_inv!22556 _keys!1717)))

(declare-fun b!973744 () Bool)

(declare-fun res!651798 () Bool)

(assert (=> b!973744 (=> (not res!651798) (not e!548874))))

(declare-datatypes ((List!20229 0))(
  ( (Nil!20226) (Cons!20225 (h!21387 (_ BitVec 64)) (t!28704 List!20229)) )
))
(declare-fun arrayNoDuplicates!0 (array!60591 (_ BitVec 32) List!20229) Bool)

(assert (=> b!973744 (= res!651798 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20226))))

(declare-fun b!973745 () Bool)

(declare-fun e!548875 () Bool)

(assert (=> b!973745 (= e!548870 (and e!548875 mapRes!35422))))

(declare-fun condMapEmpty!35422 () Bool)

(declare-fun mapDefault!35422 () ValueCell!10656)

(assert (=> b!973745 (= condMapEmpty!35422 (= (arr!29160 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10656)) mapDefault!35422)))))

(declare-fun b!973746 () Bool)

(assert (=> b!973746 (= e!548875 tp_is_empty!22275)))

(assert (= (and start!83384 res!651799) b!973738))

(assert (= (and b!973738 res!651797) b!973742))

(assert (= (and b!973742 res!651803) b!973744))

(assert (= (and b!973744 res!651798) b!973740))

(assert (= (and b!973740 res!651801) b!973741))

(assert (= (and b!973741 res!651800) b!973737))

(assert (= (and b!973737 res!651802) b!973739))

(assert (= (and b!973739 res!651804) b!973736))

(assert (= (and b!973745 condMapEmpty!35422) mapIsEmpty!35422))

(assert (= (and b!973745 (not condMapEmpty!35422)) mapNonEmpty!35422))

(get-info :version)

(assert (= (and mapNonEmpty!35422 ((_ is ValueCellFull!10656) mapValue!35422)) b!973743))

(assert (= (and b!973745 ((_ is ValueCellFull!10656) mapDefault!35422)) b!973746))

(assert (= start!83384 b!973745))

(declare-fun b_lambda!14541 () Bool)

(assert (=> (not b_lambda!14541) (not b!973736)))

(declare-fun t!28702 () Bool)

(declare-fun tb!6325 () Bool)

(assert (=> (and start!83384 (= defaultEntry!1428 defaultEntry!1428) t!28702) tb!6325))

(declare-fun result!12627 () Bool)

(assert (=> tb!6325 (= result!12627 tp_is_empty!22275)))

(assert (=> b!973736 t!28702))

(declare-fun b_and!30977 () Bool)

(assert (= b_and!30975 (and (=> t!28702 result!12627) b_and!30977)))

(declare-fun m!901407 () Bool)

(assert (=> b!973737 m!901407))

(assert (=> b!973737 m!901407))

(declare-fun m!901409 () Bool)

(assert (=> b!973737 m!901409))

(declare-fun m!901411 () Bool)

(assert (=> b!973737 m!901411))

(assert (=> b!973741 m!901407))

(assert (=> b!973741 m!901407))

(declare-fun m!901413 () Bool)

(assert (=> b!973741 m!901413))

(declare-fun m!901415 () Bool)

(assert (=> b!973742 m!901415))

(declare-fun m!901417 () Bool)

(assert (=> start!83384 m!901417))

(declare-fun m!901419 () Bool)

(assert (=> start!83384 m!901419))

(declare-fun m!901421 () Bool)

(assert (=> start!83384 m!901421))

(declare-fun m!901423 () Bool)

(assert (=> b!973739 m!901423))

(declare-fun m!901425 () Bool)

(assert (=> b!973739 m!901425))

(declare-fun m!901427 () Bool)

(assert (=> b!973739 m!901427))

(declare-fun m!901429 () Bool)

(assert (=> mapNonEmpty!35422 m!901429))

(declare-fun m!901431 () Bool)

(assert (=> b!973744 m!901431))

(declare-fun m!901433 () Bool)

(assert (=> b!973736 m!901433))

(declare-fun m!901435 () Bool)

(assert (=> b!973736 m!901435))

(declare-fun m!901437 () Bool)

(assert (=> b!973736 m!901437))

(declare-fun m!901439 () Bool)

(assert (=> b!973736 m!901439))

(declare-fun m!901441 () Bool)

(assert (=> b!973736 m!901441))

(assert (=> b!973736 m!901407))

(declare-fun m!901443 () Bool)

(assert (=> b!973736 m!901443))

(assert (=> b!973736 m!901407))

(assert (=> b!973736 m!901433))

(assert (=> b!973736 m!901439))

(declare-fun m!901445 () Bool)

(assert (=> b!973736 m!901445))

(declare-fun m!901447 () Bool)

(assert (=> b!973736 m!901447))

(assert (=> b!973736 m!901441))

(assert (=> b!973736 m!901407))

(declare-fun m!901449 () Bool)

(assert (=> b!973736 m!901449))

(assert (=> b!973736 m!901435))

(check-sat b_and!30977 tp_is_empty!22275 (not b!973742) (not b!973739) (not b!973736) (not b!973737) (not b_lambda!14541) (not b!973744) (not mapNonEmpty!35422) (not start!83384) (not b_next!19377) (not b!973741))
(check-sat b_and!30977 (not b_next!19377))
