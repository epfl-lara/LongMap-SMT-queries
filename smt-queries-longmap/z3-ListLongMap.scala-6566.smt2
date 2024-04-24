; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83448 () Bool)

(assert start!83448)

(declare-fun b_free!19273 () Bool)

(declare-fun b_next!19273 () Bool)

(assert (=> start!83448 (= b_free!19273 (not b_next!19273))))

(declare-fun tp!67099 () Bool)

(declare-fun b_and!30777 () Bool)

(assert (=> start!83448 (= tp!67099 b_and!30777)))

(declare-fun b!972819 () Bool)

(declare-fun e!548439 () Bool)

(declare-fun tp_is_empty!22171 () Bool)

(assert (=> b!972819 (= e!548439 tp_is_empty!22171)))

(declare-fun b!972820 () Bool)

(declare-fun res!650896 () Bool)

(declare-fun e!548443 () Bool)

(assert (=> b!972820 (=> (not res!650896) (not e!548443))))

(declare-datatypes ((array!60414 0))(
  ( (array!60415 (arr!29066 (Array (_ BitVec 32) (_ BitVec 64))) (size!29546 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60414)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!972820 (= res!650896 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29546 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29546 _keys!1717))))))

(declare-fun mapNonEmpty!35266 () Bool)

(declare-fun mapRes!35266 () Bool)

(declare-fun tp!67098 () Bool)

(declare-fun e!548442 () Bool)

(assert (=> mapNonEmpty!35266 (= mapRes!35266 (and tp!67098 e!548442))))

(declare-fun mapKey!35266 () (_ BitVec 32))

(declare-datatypes ((V!34545 0))(
  ( (V!34546 (val!11136 Int)) )
))
(declare-datatypes ((ValueCell!10604 0))(
  ( (ValueCellFull!10604 (v!13692 V!34545)) (EmptyCell!10604) )
))
(declare-datatypes ((array!60416 0))(
  ( (array!60417 (arr!29067 (Array (_ BitVec 32) ValueCell!10604)) (size!29547 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60416)

(declare-fun mapRest!35266 () (Array (_ BitVec 32) ValueCell!10604))

(declare-fun mapValue!35266 () ValueCell!10604)

(assert (=> mapNonEmpty!35266 (= (arr!29067 _values!1425) (store mapRest!35266 mapKey!35266 mapValue!35266))))

(declare-fun b!972821 () Bool)

(declare-fun e!548440 () Bool)

(assert (=> b!972821 (= e!548440 (not true))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun lt!432264 () (_ BitVec 64))

(declare-fun zeroValue!1367 () V!34545)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34545)

(declare-datatypes ((tuple2!14284 0))(
  ( (tuple2!14285 (_1!7153 (_ BitVec 64)) (_2!7153 V!34545)) )
))
(declare-datatypes ((List!20136 0))(
  ( (Nil!20133) (Cons!20132 (h!21300 tuple2!14284) (t!28499 List!20136)) )
))
(declare-datatypes ((ListLongMap!12983 0))(
  ( (ListLongMap!12984 (toList!6507 List!20136)) )
))
(declare-fun lt!432263 () ListLongMap!12983)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun +!2888 (ListLongMap!12983 tuple2!14284) ListLongMap!12983)

(declare-fun getCurrentListMap!3740 (array!60414 array!60416 (_ BitVec 32) (_ BitVec 32) V!34545 V!34545 (_ BitVec 32) Int) ListLongMap!12983)

(declare-fun get!15071 (ValueCell!10604 V!34545) V!34545)

(declare-fun dynLambda!1685 (Int (_ BitVec 64)) V!34545)

(assert (=> b!972821 (= lt!432263 (+!2888 (getCurrentListMap!3740 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14285 lt!432264 (get!15071 (select (arr!29067 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1685 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32340 0))(
  ( (Unit!32341) )
))
(declare-fun lt!432262 () Unit!32340)

(declare-fun lemmaListMapRecursiveValidKeyArray!244 (array!60414 array!60416 (_ BitVec 32) (_ BitVec 32) V!34545 V!34545 (_ BitVec 32) Int) Unit!32340)

(assert (=> b!972821 (= lt!432262 (lemmaListMapRecursiveValidKeyArray!244 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!650893 () Bool)

(assert (=> start!83448 (=> (not res!650893) (not e!548443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83448 (= res!650893 (validMask!0 mask!2147))))

(assert (=> start!83448 e!548443))

(assert (=> start!83448 true))

(declare-fun e!548438 () Bool)

(declare-fun array_inv!22543 (array!60416) Bool)

(assert (=> start!83448 (and (array_inv!22543 _values!1425) e!548438)))

(assert (=> start!83448 tp_is_empty!22171))

(assert (=> start!83448 tp!67099))

(declare-fun array_inv!22544 (array!60414) Bool)

(assert (=> start!83448 (array_inv!22544 _keys!1717)))

(declare-fun b!972822 () Bool)

(declare-fun res!650899 () Bool)

(assert (=> b!972822 (=> (not res!650899) (not e!548443))))

(declare-fun contains!5620 (ListLongMap!12983 (_ BitVec 64)) Bool)

(assert (=> b!972822 (= res!650899 (contains!5620 (getCurrentListMap!3740 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29066 _keys!1717) i!822)))))

(declare-fun b!972823 () Bool)

(assert (=> b!972823 (= e!548443 e!548440)))

(declare-fun res!650898 () Bool)

(assert (=> b!972823 (=> (not res!650898) (not e!548440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972823 (= res!650898 (validKeyInArray!0 lt!432264))))

(assert (=> b!972823 (= lt!432264 (select (arr!29066 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!972823 (= lt!432263 (getCurrentListMap!3740 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapIsEmpty!35266 () Bool)

(assert (=> mapIsEmpty!35266 mapRes!35266))

(declare-fun b!972824 () Bool)

(declare-fun res!650900 () Bool)

(assert (=> b!972824 (=> (not res!650900) (not e!548443))))

(assert (=> b!972824 (= res!650900 (and (= (size!29547 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29546 _keys!1717) (size!29547 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972825 () Bool)

(declare-fun res!650895 () Bool)

(assert (=> b!972825 (=> (not res!650895) (not e!548443))))

(assert (=> b!972825 (= res!650895 (validKeyInArray!0 (select (arr!29066 _keys!1717) i!822)))))

(declare-fun b!972826 () Bool)

(assert (=> b!972826 (= e!548438 (and e!548439 mapRes!35266))))

(declare-fun condMapEmpty!35266 () Bool)

(declare-fun mapDefault!35266 () ValueCell!10604)

(assert (=> b!972826 (= condMapEmpty!35266 (= (arr!29067 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10604)) mapDefault!35266)))))

(declare-fun b!972827 () Bool)

(declare-fun res!650897 () Bool)

(assert (=> b!972827 (=> (not res!650897) (not e!548443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60414 (_ BitVec 32)) Bool)

(assert (=> b!972827 (= res!650897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972828 () Bool)

(assert (=> b!972828 (= e!548442 tp_is_empty!22171)))

(declare-fun b!972829 () Bool)

(declare-fun res!650894 () Bool)

(assert (=> b!972829 (=> (not res!650894) (not e!548443))))

(declare-datatypes ((List!20137 0))(
  ( (Nil!20134) (Cons!20133 (h!21301 (_ BitVec 64)) (t!28500 List!20137)) )
))
(declare-fun arrayNoDuplicates!0 (array!60414 (_ BitVec 32) List!20137) Bool)

(assert (=> b!972829 (= res!650894 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20134))))

(assert (= (and start!83448 res!650893) b!972824))

(assert (= (and b!972824 res!650900) b!972827))

(assert (= (and b!972827 res!650897) b!972829))

(assert (= (and b!972829 res!650894) b!972820))

(assert (= (and b!972820 res!650896) b!972825))

(assert (= (and b!972825 res!650895) b!972822))

(assert (= (and b!972822 res!650899) b!972823))

(assert (= (and b!972823 res!650898) b!972821))

(assert (= (and b!972826 condMapEmpty!35266) mapIsEmpty!35266))

(assert (= (and b!972826 (not condMapEmpty!35266)) mapNonEmpty!35266))

(get-info :version)

(assert (= (and mapNonEmpty!35266 ((_ is ValueCellFull!10604) mapValue!35266)) b!972828))

(assert (= (and b!972826 ((_ is ValueCellFull!10604) mapDefault!35266)) b!972819))

(assert (= start!83448 b!972826))

(declare-fun b_lambda!14451 () Bool)

(assert (=> (not b_lambda!14451) (not b!972821)))

(declare-fun t!28498 () Bool)

(declare-fun tb!6213 () Bool)

(assert (=> (and start!83448 (= defaultEntry!1428 defaultEntry!1428) t!28498) tb!6213))

(declare-fun result!12411 () Bool)

(assert (=> tb!6213 (= result!12411 tp_is_empty!22171)))

(assert (=> b!972821 t!28498))

(declare-fun b_and!30779 () Bool)

(assert (= b_and!30777 (and (=> t!28498 result!12411) b_and!30779)))

(declare-fun m!900575 () Bool)

(assert (=> b!972827 m!900575))

(declare-fun m!900577 () Bool)

(assert (=> mapNonEmpty!35266 m!900577))

(declare-fun m!900579 () Bool)

(assert (=> b!972823 m!900579))

(declare-fun m!900581 () Bool)

(assert (=> b!972823 m!900581))

(declare-fun m!900583 () Bool)

(assert (=> b!972823 m!900583))

(declare-fun m!900585 () Bool)

(assert (=> b!972829 m!900585))

(declare-fun m!900587 () Bool)

(assert (=> b!972825 m!900587))

(assert (=> b!972825 m!900587))

(declare-fun m!900589 () Bool)

(assert (=> b!972825 m!900589))

(declare-fun m!900591 () Bool)

(assert (=> b!972822 m!900591))

(assert (=> b!972822 m!900587))

(assert (=> b!972822 m!900591))

(assert (=> b!972822 m!900587))

(declare-fun m!900593 () Bool)

(assert (=> b!972822 m!900593))

(declare-fun m!900595 () Bool)

(assert (=> b!972821 m!900595))

(declare-fun m!900597 () Bool)

(assert (=> b!972821 m!900597))

(declare-fun m!900599 () Bool)

(assert (=> b!972821 m!900599))

(declare-fun m!900601 () Bool)

(assert (=> b!972821 m!900601))

(assert (=> b!972821 m!900595))

(assert (=> b!972821 m!900599))

(declare-fun m!900603 () Bool)

(assert (=> b!972821 m!900603))

(assert (=> b!972821 m!900597))

(declare-fun m!900605 () Bool)

(assert (=> b!972821 m!900605))

(declare-fun m!900607 () Bool)

(assert (=> start!83448 m!900607))

(declare-fun m!900609 () Bool)

(assert (=> start!83448 m!900609))

(declare-fun m!900611 () Bool)

(assert (=> start!83448 m!900611))

(check-sat (not b_next!19273) (not b!972823) (not b!972829) (not b!972822) b_and!30779 (not start!83448) tp_is_empty!22171 (not b!972825) (not b!972827) (not mapNonEmpty!35266) (not b!972821) (not b_lambda!14451))
(check-sat b_and!30779 (not b_next!19273))
