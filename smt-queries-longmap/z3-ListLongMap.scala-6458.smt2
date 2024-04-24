; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82756 () Bool)

(assert start!82756)

(declare-fun b_free!18721 () Bool)

(declare-fun b_next!18721 () Bool)

(assert (=> start!82756 (= b_free!18721 (not b_next!18721))))

(declare-fun tp!65284 () Bool)

(declare-fun b_and!30219 () Bool)

(assert (=> start!82756 (= tp!65284 b_and!30219)))

(declare-fun b!963422 () Bool)

(declare-fun res!644484 () Bool)

(declare-fun e!543373 () Bool)

(assert (=> b!963422 (=> (not res!644484) (not e!543373))))

(declare-datatypes ((array!59160 0))(
  ( (array!59161 (arr!28444 (Array (_ BitVec 32) (_ BitVec 64))) (size!28924 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59160)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59160 (_ BitVec 32)) Bool)

(assert (=> b!963422 (= res!644484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963423 () Bool)

(declare-fun res!644486 () Bool)

(assert (=> b!963423 (=> (not res!644486) (not e!543373))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33681 0))(
  ( (V!33682 (val!10812 Int)) )
))
(declare-datatypes ((ValueCell!10280 0))(
  ( (ValueCellFull!10280 (v!13367 V!33681)) (EmptyCell!10280) )
))
(declare-datatypes ((array!59162 0))(
  ( (array!59163 (arr!28445 (Array (_ BitVec 32) ValueCell!10280)) (size!28925 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59162)

(assert (=> b!963423 (= res!644486 (and (= (size!28925 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28924 _keys!1686) (size!28925 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963424 () Bool)

(declare-fun res!644483 () Bool)

(assert (=> b!963424 (=> (not res!644483) (not e!543373))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963424 (= res!644483 (validKeyInArray!0 (select (arr!28444 _keys!1686) i!803)))))

(declare-fun res!644485 () Bool)

(assert (=> start!82756 (=> (not res!644485) (not e!543373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82756 (= res!644485 (validMask!0 mask!2110))))

(assert (=> start!82756 e!543373))

(assert (=> start!82756 true))

(declare-fun e!543375 () Bool)

(declare-fun array_inv!22111 (array!59162) Bool)

(assert (=> start!82756 (and (array_inv!22111 _values!1400) e!543375)))

(declare-fun array_inv!22112 (array!59160) Bool)

(assert (=> start!82756 (array_inv!22112 _keys!1686)))

(assert (=> start!82756 tp!65284))

(declare-fun tp_is_empty!21523 () Bool)

(assert (=> start!82756 tp_is_empty!21523))

(declare-fun b!963425 () Bool)

(declare-fun e!543374 () Bool)

(assert (=> b!963425 (= e!543374 tp_is_empty!21523)))

(declare-fun b!963426 () Bool)

(declare-fun e!543377 () Bool)

(assert (=> b!963426 (= e!543377 tp_is_empty!21523)))

(declare-fun b!963427 () Bool)

(declare-fun res!644482 () Bool)

(assert (=> b!963427 (=> (not res!644482) (not e!543373))))

(declare-datatypes ((List!19719 0))(
  ( (Nil!19716) (Cons!19715 (h!20883 (_ BitVec 64)) (t!28074 List!19719)) )
))
(declare-fun arrayNoDuplicates!0 (array!59160 (_ BitVec 32) List!19719) Bool)

(assert (=> b!963427 (= res!644482 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19716))))

(declare-fun mapIsEmpty!34279 () Bool)

(declare-fun mapRes!34279 () Bool)

(assert (=> mapIsEmpty!34279 mapRes!34279))

(declare-fun b!963428 () Bool)

(declare-fun res!644487 () Bool)

(assert (=> b!963428 (=> (not res!644487) (not e!543373))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!963428 (= res!644487 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28924 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28924 _keys!1686))))))

(declare-fun mapNonEmpty!34279 () Bool)

(declare-fun tp!65283 () Bool)

(assert (=> mapNonEmpty!34279 (= mapRes!34279 (and tp!65283 e!543374))))

(declare-fun mapKey!34279 () (_ BitVec 32))

(declare-fun mapRest!34279 () (Array (_ BitVec 32) ValueCell!10280))

(declare-fun mapValue!34279 () ValueCell!10280)

(assert (=> mapNonEmpty!34279 (= (arr!28445 _values!1400) (store mapRest!34279 mapKey!34279 mapValue!34279))))

(declare-fun b!963429 () Bool)

(assert (=> b!963429 (= e!543375 (and e!543377 mapRes!34279))))

(declare-fun condMapEmpty!34279 () Bool)

(declare-fun mapDefault!34279 () ValueCell!10280)

(assert (=> b!963429 (= condMapEmpty!34279 (= (arr!28445 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10280)) mapDefault!34279)))))

(declare-fun b!963430 () Bool)

(assert (=> b!963430 (= e!543373 false)))

(declare-fun lt!431246 () Bool)

(declare-fun minValue!1342 () V!33681)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33681)

(declare-datatypes ((tuple2!13868 0))(
  ( (tuple2!13869 (_1!6945 (_ BitVec 64)) (_2!6945 V!33681)) )
))
(declare-datatypes ((List!19720 0))(
  ( (Nil!19717) (Cons!19716 (h!20884 tuple2!13868) (t!28075 List!19720)) )
))
(declare-datatypes ((ListLongMap!12567 0))(
  ( (ListLongMap!12568 (toList!6299 List!19720)) )
))
(declare-fun contains!5414 (ListLongMap!12567 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3532 (array!59160 array!59162 (_ BitVec 32) (_ BitVec 32) V!33681 V!33681 (_ BitVec 32) Int) ListLongMap!12567)

(assert (=> b!963430 (= lt!431246 (contains!5414 (getCurrentListMap!3532 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28444 _keys!1686) i!803)))))

(assert (= (and start!82756 res!644485) b!963423))

(assert (= (and b!963423 res!644486) b!963422))

(assert (= (and b!963422 res!644484) b!963427))

(assert (= (and b!963427 res!644482) b!963428))

(assert (= (and b!963428 res!644487) b!963424))

(assert (= (and b!963424 res!644483) b!963430))

(assert (= (and b!963429 condMapEmpty!34279) mapIsEmpty!34279))

(assert (= (and b!963429 (not condMapEmpty!34279)) mapNonEmpty!34279))

(get-info :version)

(assert (= (and mapNonEmpty!34279 ((_ is ValueCellFull!10280) mapValue!34279)) b!963425))

(assert (= (and b!963429 ((_ is ValueCellFull!10280) mapDefault!34279)) b!963426))

(assert (= start!82756 b!963429))

(declare-fun m!893443 () Bool)

(assert (=> b!963422 m!893443))

(declare-fun m!893445 () Bool)

(assert (=> b!963424 m!893445))

(assert (=> b!963424 m!893445))

(declare-fun m!893447 () Bool)

(assert (=> b!963424 m!893447))

(declare-fun m!893449 () Bool)

(assert (=> start!82756 m!893449))

(declare-fun m!893451 () Bool)

(assert (=> start!82756 m!893451))

(declare-fun m!893453 () Bool)

(assert (=> start!82756 m!893453))

(declare-fun m!893455 () Bool)

(assert (=> b!963430 m!893455))

(assert (=> b!963430 m!893445))

(assert (=> b!963430 m!893455))

(assert (=> b!963430 m!893445))

(declare-fun m!893457 () Bool)

(assert (=> b!963430 m!893457))

(declare-fun m!893459 () Bool)

(assert (=> b!963427 m!893459))

(declare-fun m!893461 () Bool)

(assert (=> mapNonEmpty!34279 m!893461))

(check-sat tp_is_empty!21523 (not b!963427) (not start!82756) (not b!963424) b_and!30219 (not b!963422) (not b_next!18721) (not b!963430) (not mapNonEmpty!34279))
(check-sat b_and!30219 (not b_next!18721))
