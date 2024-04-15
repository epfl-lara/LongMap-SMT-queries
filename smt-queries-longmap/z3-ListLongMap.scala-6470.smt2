; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82642 () Bool)

(assert start!82642)

(declare-fun b_free!18793 () Bool)

(declare-fun b_next!18793 () Bool)

(assert (=> start!82642 (= b_free!18793 (not b_next!18793))))

(declare-fun tp!65500 () Bool)

(declare-fun b_and!30255 () Bool)

(assert (=> start!82642 (= tp!65500 b_and!30255)))

(declare-fun b!963418 () Bool)

(declare-fun res!644849 () Bool)

(declare-fun e!543183 () Bool)

(assert (=> b!963418 (=> (not res!644849) (not e!543183))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33777 0))(
  ( (V!33778 (val!10848 Int)) )
))
(declare-datatypes ((ValueCell!10316 0))(
  ( (ValueCellFull!10316 (v!13405 V!33777)) (EmptyCell!10316) )
))
(declare-datatypes ((array!59216 0))(
  ( (array!59217 (arr!28477 (Array (_ BitVec 32) ValueCell!10316)) (size!28958 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59216)

(declare-datatypes ((array!59218 0))(
  ( (array!59219 (arr!28478 (Array (_ BitVec 32) (_ BitVec 64))) (size!28959 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59218)

(declare-fun minValue!1342 () V!33777)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33777)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14004 0))(
  ( (tuple2!14005 (_1!7013 (_ BitVec 64)) (_2!7013 V!33777)) )
))
(declare-datatypes ((List!19812 0))(
  ( (Nil!19809) (Cons!19808 (h!20970 tuple2!14004) (t!28166 List!19812)) )
))
(declare-datatypes ((ListLongMap!12691 0))(
  ( (ListLongMap!12692 (toList!6361 List!19812)) )
))
(declare-fun contains!5408 (ListLongMap!12691 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3523 (array!59218 array!59216 (_ BitVec 32) (_ BitVec 32) V!33777 V!33777 (_ BitVec 32) Int) ListLongMap!12691)

(assert (=> b!963418 (= res!644849 (contains!5408 (getCurrentListMap!3523 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28478 _keys!1686) i!803)))))

(declare-fun b!963419 () Bool)

(declare-fun e!543184 () Bool)

(declare-fun e!543185 () Bool)

(declare-fun mapRes!34387 () Bool)

(assert (=> b!963419 (= e!543184 (and e!543185 mapRes!34387))))

(declare-fun condMapEmpty!34387 () Bool)

(declare-fun mapDefault!34387 () ValueCell!10316)

(assert (=> b!963419 (= condMapEmpty!34387 (= (arr!28477 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10316)) mapDefault!34387)))))

(declare-fun mapIsEmpty!34387 () Bool)

(assert (=> mapIsEmpty!34387 mapRes!34387))

(declare-fun b!963420 () Bool)

(declare-fun res!644847 () Bool)

(assert (=> b!963420 (=> (not res!644847) (not e!543183))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963420 (= res!644847 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963421 () Bool)

(declare-fun res!644844 () Bool)

(assert (=> b!963421 (=> (not res!644844) (not e!543183))))

(assert (=> b!963421 (= res!644844 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28959 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28959 _keys!1686))))))

(declare-fun b!963422 () Bool)

(declare-fun res!644848 () Bool)

(assert (=> b!963422 (=> (not res!644848) (not e!543183))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59218 (_ BitVec 32)) Bool)

(assert (=> b!963422 (= res!644848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapNonEmpty!34387 () Bool)

(declare-fun tp!65499 () Bool)

(declare-fun e!543187 () Bool)

(assert (=> mapNonEmpty!34387 (= mapRes!34387 (and tp!65499 e!543187))))

(declare-fun mapKey!34387 () (_ BitVec 32))

(declare-fun mapValue!34387 () ValueCell!10316)

(declare-fun mapRest!34387 () (Array (_ BitVec 32) ValueCell!10316))

(assert (=> mapNonEmpty!34387 (= (arr!28477 _values!1400) (store mapRest!34387 mapKey!34387 mapValue!34387))))

(declare-fun b!963423 () Bool)

(declare-fun res!644845 () Bool)

(assert (=> b!963423 (=> (not res!644845) (not e!543183))))

(assert (=> b!963423 (= res!644845 (and (= (size!28958 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28959 _keys!1686) (size!28958 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963424 () Bool)

(declare-fun tp_is_empty!21595 () Bool)

(assert (=> b!963424 (= e!543185 tp_is_empty!21595)))

(declare-fun res!644842 () Bool)

(assert (=> start!82642 (=> (not res!644842) (not e!543183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82642 (= res!644842 (validMask!0 mask!2110))))

(assert (=> start!82642 e!543183))

(assert (=> start!82642 true))

(declare-fun array_inv!22121 (array!59216) Bool)

(assert (=> start!82642 (and (array_inv!22121 _values!1400) e!543184)))

(declare-fun array_inv!22122 (array!59218) Bool)

(assert (=> start!82642 (array_inv!22122 _keys!1686)))

(assert (=> start!82642 tp!65500))

(assert (=> start!82642 tp_is_empty!21595))

(declare-fun b!963425 () Bool)

(declare-fun res!644846 () Bool)

(assert (=> b!963425 (=> (not res!644846) (not e!543183))))

(declare-datatypes ((List!19813 0))(
  ( (Nil!19810) (Cons!19809 (h!20971 (_ BitVec 64)) (t!28167 List!19813)) )
))
(declare-fun arrayNoDuplicates!0 (array!59218 (_ BitVec 32) List!19813) Bool)

(assert (=> b!963425 (= res!644846 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19810))))

(declare-fun b!963426 () Bool)

(assert (=> b!963426 (= e!543187 tp_is_empty!21595)))

(declare-fun b!963427 () Bool)

(declare-fun res!644843 () Bool)

(assert (=> b!963427 (=> (not res!644843) (not e!543183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963427 (= res!644843 (validKeyInArray!0 (select (arr!28478 _keys!1686) i!803)))))

(declare-fun b!963428 () Bool)

(assert (=> b!963428 (= e!543183 (not true))))

(assert (=> b!963428 (contains!5408 (getCurrentListMap!3523 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28478 _keys!1686) i!803))))

(declare-datatypes ((Unit!32110 0))(
  ( (Unit!32111) )
))
(declare-fun lt!430757 () Unit!32110)

(declare-fun lemmaInListMapFromThenInFromMinusOne!21 (array!59218 array!59216 (_ BitVec 32) (_ BitVec 32) V!33777 V!33777 (_ BitVec 32) (_ BitVec 32) Int) Unit!32110)

(assert (=> b!963428 (= lt!430757 (lemmaInListMapFromThenInFromMinusOne!21 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(assert (= (and start!82642 res!644842) b!963423))

(assert (= (and b!963423 res!644845) b!963422))

(assert (= (and b!963422 res!644848) b!963425))

(assert (= (and b!963425 res!644846) b!963421))

(assert (= (and b!963421 res!644844) b!963427))

(assert (= (and b!963427 res!644843) b!963418))

(assert (= (and b!963418 res!644849) b!963420))

(assert (= (and b!963420 res!644847) b!963428))

(assert (= (and b!963419 condMapEmpty!34387) mapIsEmpty!34387))

(assert (= (and b!963419 (not condMapEmpty!34387)) mapNonEmpty!34387))

(get-info :version)

(assert (= (and mapNonEmpty!34387 ((_ is ValueCellFull!10316) mapValue!34387)) b!963426))

(assert (= (and b!963419 ((_ is ValueCellFull!10316) mapDefault!34387)) b!963424))

(assert (= start!82642 b!963419))

(declare-fun m!892273 () Bool)

(assert (=> b!963418 m!892273))

(declare-fun m!892275 () Bool)

(assert (=> b!963418 m!892275))

(assert (=> b!963418 m!892273))

(assert (=> b!963418 m!892275))

(declare-fun m!892277 () Bool)

(assert (=> b!963418 m!892277))

(assert (=> b!963427 m!892275))

(assert (=> b!963427 m!892275))

(declare-fun m!892279 () Bool)

(assert (=> b!963427 m!892279))

(declare-fun m!892281 () Bool)

(assert (=> mapNonEmpty!34387 m!892281))

(declare-fun m!892283 () Bool)

(assert (=> b!963422 m!892283))

(declare-fun m!892285 () Bool)

(assert (=> b!963425 m!892285))

(declare-fun m!892287 () Bool)

(assert (=> start!82642 m!892287))

(declare-fun m!892289 () Bool)

(assert (=> start!82642 m!892289))

(declare-fun m!892291 () Bool)

(assert (=> start!82642 m!892291))

(declare-fun m!892293 () Bool)

(assert (=> b!963428 m!892293))

(assert (=> b!963428 m!892275))

(assert (=> b!963428 m!892293))

(assert (=> b!963428 m!892275))

(declare-fun m!892295 () Bool)

(assert (=> b!963428 m!892295))

(declare-fun m!892297 () Bool)

(assert (=> b!963428 m!892297))

(check-sat (not b!963422) (not mapNonEmpty!34387) (not b!963427) (not b_next!18793) (not b!963418) (not b!963428) (not start!82642) (not b!963425) tp_is_empty!21595 b_and!30255)
(check-sat b_and!30255 (not b_next!18793))
