; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83262 () Bool)

(assert start!83262)

(declare-fun b_free!19273 () Bool)

(declare-fun b_next!19273 () Bool)

(assert (=> start!83262 (= b_free!19273 (not b_next!19273))))

(declare-fun tp!67099 () Bool)

(declare-fun b_and!30741 () Bool)

(assert (=> start!83262 (= tp!67099 b_and!30741)))

(declare-fun b!971677 () Bool)

(declare-fun res!650441 () Bool)

(declare-fun e!547708 () Bool)

(assert (=> b!971677 (=> (not res!650441) (not e!547708))))

(declare-datatypes ((array!60324 0))(
  ( (array!60325 (arr!29026 (Array (_ BitVec 32) (_ BitVec 64))) (size!29507 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60324)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971677 (= res!650441 (validKeyInArray!0 (select (arr!29026 _keys!1717) i!822)))))

(declare-fun b!971678 () Bool)

(declare-fun e!547710 () Bool)

(assert (=> b!971678 (= e!547708 e!547710)))

(declare-fun res!650443 () Bool)

(assert (=> b!971678 (=> (not res!650443) (not e!547710))))

(declare-fun lt!431667 () (_ BitVec 64))

(assert (=> b!971678 (= res!650443 (validKeyInArray!0 lt!431667))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!971678 (= lt!431667 (select (arr!29026 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34545 0))(
  ( (V!34546 (val!11136 Int)) )
))
(declare-datatypes ((ValueCell!10604 0))(
  ( (ValueCellFull!10604 (v!13694 V!34545)) (EmptyCell!10604) )
))
(declare-datatypes ((array!60326 0))(
  ( (array!60327 (arr!29027 (Array (_ BitVec 32) ValueCell!10604)) (size!29508 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60326)

(declare-fun zeroValue!1367 () V!34545)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34545)

(declare-datatypes ((tuple2!14362 0))(
  ( (tuple2!14363 (_1!7192 (_ BitVec 64)) (_2!7192 V!34545)) )
))
(declare-datatypes ((List!20175 0))(
  ( (Nil!20172) (Cons!20171 (h!21333 tuple2!14362) (t!28537 List!20175)) )
))
(declare-datatypes ((ListLongMap!13049 0))(
  ( (ListLongMap!13050 (toList!6540 List!20175)) )
))
(declare-fun lt!431665 () ListLongMap!13049)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3702 (array!60324 array!60326 (_ BitVec 32) (_ BitVec 32) V!34545 V!34545 (_ BitVec 32) Int) ListLongMap!13049)

(assert (=> b!971678 (= lt!431665 (getCurrentListMap!3702 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971680 () Bool)

(declare-fun res!650445 () Bool)

(assert (=> b!971680 (=> (not res!650445) (not e!547708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60324 (_ BitVec 32)) Bool)

(assert (=> b!971680 (= res!650445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971681 () Bool)

(declare-fun res!650444 () Bool)

(assert (=> b!971681 (=> (not res!650444) (not e!547708))))

(declare-datatypes ((List!20176 0))(
  ( (Nil!20173) (Cons!20172 (h!21334 (_ BitVec 64)) (t!28538 List!20176)) )
))
(declare-fun arrayNoDuplicates!0 (array!60324 (_ BitVec 32) List!20176) Bool)

(assert (=> b!971681 (= res!650444 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20173))))

(declare-fun b!971682 () Bool)

(declare-fun res!650442 () Bool)

(assert (=> b!971682 (=> (not res!650442) (not e!547708))))

(assert (=> b!971682 (= res!650442 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29507 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29507 _keys!1717))))))

(declare-fun mapNonEmpty!35266 () Bool)

(declare-fun mapRes!35266 () Bool)

(declare-fun tp!67098 () Bool)

(declare-fun e!547713 () Bool)

(assert (=> mapNonEmpty!35266 (= mapRes!35266 (and tp!67098 e!547713))))

(declare-fun mapRest!35266 () (Array (_ BitVec 32) ValueCell!10604))

(declare-fun mapValue!35266 () ValueCell!10604)

(declare-fun mapKey!35266 () (_ BitVec 32))

(assert (=> mapNonEmpty!35266 (= (arr!29027 _values!1425) (store mapRest!35266 mapKey!35266 mapValue!35266))))

(declare-fun b!971679 () Bool)

(declare-fun res!650439 () Bool)

(assert (=> b!971679 (=> (not res!650439) (not e!547708))))

(declare-fun contains!5582 (ListLongMap!13049 (_ BitVec 64)) Bool)

(assert (=> b!971679 (= res!650439 (contains!5582 (getCurrentListMap!3702 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29026 _keys!1717) i!822)))))

(declare-fun res!650446 () Bool)

(assert (=> start!83262 (=> (not res!650446) (not e!547708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83262 (= res!650446 (validMask!0 mask!2147))))

(assert (=> start!83262 e!547708))

(assert (=> start!83262 true))

(declare-fun e!547711 () Bool)

(declare-fun array_inv!22521 (array!60326) Bool)

(assert (=> start!83262 (and (array_inv!22521 _values!1425) e!547711)))

(declare-fun tp_is_empty!22171 () Bool)

(assert (=> start!83262 tp_is_empty!22171))

(assert (=> start!83262 tp!67099))

(declare-fun array_inv!22522 (array!60324) Bool)

(assert (=> start!83262 (array_inv!22522 _keys!1717)))

(declare-fun b!971683 () Bool)

(declare-fun e!547709 () Bool)

(assert (=> b!971683 (= e!547711 (and e!547709 mapRes!35266))))

(declare-fun condMapEmpty!35266 () Bool)

(declare-fun mapDefault!35266 () ValueCell!10604)

(assert (=> b!971683 (= condMapEmpty!35266 (= (arr!29027 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10604)) mapDefault!35266)))))

(declare-fun b!971684 () Bool)

(assert (=> b!971684 (= e!547713 tp_is_empty!22171)))

(declare-fun b!971685 () Bool)

(assert (=> b!971685 (= e!547709 tp_is_empty!22171)))

(declare-fun mapIsEmpty!35266 () Bool)

(assert (=> mapIsEmpty!35266 mapRes!35266))

(declare-fun b!971686 () Bool)

(declare-fun res!650440 () Bool)

(assert (=> b!971686 (=> (not res!650440) (not e!547708))))

(assert (=> b!971686 (= res!650440 (and (= (size!29508 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29507 _keys!1717) (size!29508 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971687 () Bool)

(assert (=> b!971687 (= e!547710 (not true))))

(declare-fun +!2895 (ListLongMap!13049 tuple2!14362) ListLongMap!13049)

(declare-fun get!15038 (ValueCell!10604 V!34545) V!34545)

(declare-fun dynLambda!1651 (Int (_ BitVec 64)) V!34545)

(assert (=> b!971687 (= lt!431665 (+!2895 (getCurrentListMap!3702 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14363 lt!431667 (get!15038 (select (arr!29027 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1651 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32242 0))(
  ( (Unit!32243) )
))
(declare-fun lt!431666 () Unit!32242)

(declare-fun lemmaListMapRecursiveValidKeyArray!235 (array!60324 array!60326 (_ BitVec 32) (_ BitVec 32) V!34545 V!34545 (_ BitVec 32) Int) Unit!32242)

(assert (=> b!971687 (= lt!431666 (lemmaListMapRecursiveValidKeyArray!235 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(assert (= (and start!83262 res!650446) b!971686))

(assert (= (and b!971686 res!650440) b!971680))

(assert (= (and b!971680 res!650445) b!971681))

(assert (= (and b!971681 res!650444) b!971682))

(assert (= (and b!971682 res!650442) b!971677))

(assert (= (and b!971677 res!650441) b!971679))

(assert (= (and b!971679 res!650439) b!971678))

(assert (= (and b!971678 res!650443) b!971687))

(assert (= (and b!971683 condMapEmpty!35266) mapIsEmpty!35266))

(assert (= (and b!971683 (not condMapEmpty!35266)) mapNonEmpty!35266))

(get-info :version)

(assert (= (and mapNonEmpty!35266 ((_ is ValueCellFull!10604) mapValue!35266)) b!971684))

(assert (= (and b!971683 ((_ is ValueCellFull!10604) mapDefault!35266)) b!971685))

(assert (= start!83262 b!971683))

(declare-fun b_lambda!14419 () Bool)

(assert (=> (not b_lambda!14419) (not b!971687)))

(declare-fun t!28536 () Bool)

(declare-fun tb!6213 () Bool)

(assert (=> (and start!83262 (= defaultEntry!1428 defaultEntry!1428) t!28536) tb!6213))

(declare-fun result!12411 () Bool)

(assert (=> tb!6213 (= result!12411 tp_is_empty!22171)))

(assert (=> b!971687 t!28536))

(declare-fun b_and!30743 () Bool)

(assert (= b_and!30741 (and (=> t!28536 result!12411) b_and!30743)))

(declare-fun m!898523 () Bool)

(assert (=> b!971687 m!898523))

(declare-fun m!898525 () Bool)

(assert (=> b!971687 m!898525))

(declare-fun m!898527 () Bool)

(assert (=> b!971687 m!898527))

(assert (=> b!971687 m!898523))

(assert (=> b!971687 m!898527))

(declare-fun m!898529 () Bool)

(assert (=> b!971687 m!898529))

(assert (=> b!971687 m!898525))

(declare-fun m!898531 () Bool)

(assert (=> b!971687 m!898531))

(declare-fun m!898533 () Bool)

(assert (=> b!971687 m!898533))

(declare-fun m!898535 () Bool)

(assert (=> b!971677 m!898535))

(assert (=> b!971677 m!898535))

(declare-fun m!898537 () Bool)

(assert (=> b!971677 m!898537))

(declare-fun m!898539 () Bool)

(assert (=> b!971678 m!898539))

(declare-fun m!898541 () Bool)

(assert (=> b!971678 m!898541))

(declare-fun m!898543 () Bool)

(assert (=> b!971678 m!898543))

(declare-fun m!898545 () Bool)

(assert (=> start!83262 m!898545))

(declare-fun m!898547 () Bool)

(assert (=> start!83262 m!898547))

(declare-fun m!898549 () Bool)

(assert (=> start!83262 m!898549))

(declare-fun m!898551 () Bool)

(assert (=> mapNonEmpty!35266 m!898551))

(declare-fun m!898553 () Bool)

(assert (=> b!971680 m!898553))

(declare-fun m!898555 () Bool)

(assert (=> b!971679 m!898555))

(assert (=> b!971679 m!898535))

(assert (=> b!971679 m!898555))

(assert (=> b!971679 m!898535))

(declare-fun m!898557 () Bool)

(assert (=> b!971679 m!898557))

(declare-fun m!898559 () Bool)

(assert (=> b!971681 m!898559))

(check-sat (not start!83262) (not b_lambda!14419) (not b!971687) b_and!30743 (not b!971680) (not b_next!19273) (not mapNonEmpty!35266) (not b!971679) (not b!971678) tp_is_empty!22171 (not b!971677) (not b!971681))
(check-sat b_and!30743 (not b_next!19273))
