; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83318 () Bool)

(assert start!83318)

(declare-fun b_free!19311 () Bool)

(declare-fun b_next!19311 () Bool)

(assert (=> start!83318 (= b_free!19311 (not b_next!19311))))

(declare-fun tp!67211 () Bool)

(declare-fun b_and!30843 () Bool)

(assert (=> start!83318 (= tp!67211 b_and!30843)))

(declare-fun b!972581 () Bool)

(declare-fun res!651007 () Bool)

(declare-fun e!548198 () Bool)

(assert (=> b!972581 (=> (not res!651007) (not e!548198))))

(declare-datatypes ((array!60465 0))(
  ( (array!60466 (arr!29096 (Array (_ BitVec 32) (_ BitVec 64))) (size!29575 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60465)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972581 (= res!651007 (validKeyInArray!0 (select (arr!29096 _keys!1717) i!822)))))

(declare-fun b!972582 () Bool)

(declare-fun e!548202 () Bool)

(declare-fun tp_is_empty!22209 () Bool)

(assert (=> b!972582 (= e!548202 tp_is_empty!22209)))

(declare-fun b!972583 () Bool)

(declare-fun res!651010 () Bool)

(assert (=> b!972583 (=> (not res!651010) (not e!548198))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34595 0))(
  ( (V!34596 (val!11155 Int)) )
))
(declare-datatypes ((ValueCell!10623 0))(
  ( (ValueCellFull!10623 (v!13714 V!34595)) (EmptyCell!10623) )
))
(declare-datatypes ((array!60467 0))(
  ( (array!60468 (arr!29097 (Array (_ BitVec 32) ValueCell!10623)) (size!29576 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60467)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!972583 (= res!651010 (and (= (size!29576 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29575 _keys!1717) (size!29576 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972584 () Bool)

(declare-fun e!548203 () Bool)

(assert (=> b!972584 (= e!548203 tp_is_empty!22209)))

(declare-fun res!651009 () Bool)

(assert (=> start!83318 (=> (not res!651009) (not e!548198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83318 (= res!651009 (validMask!0 mask!2147))))

(assert (=> start!83318 e!548198))

(assert (=> start!83318 true))

(declare-fun e!548200 () Bool)

(declare-fun array_inv!22509 (array!60467) Bool)

(assert (=> start!83318 (and (array_inv!22509 _values!1425) e!548200)))

(assert (=> start!83318 tp_is_empty!22209))

(assert (=> start!83318 tp!67211))

(declare-fun array_inv!22510 (array!60465) Bool)

(assert (=> start!83318 (array_inv!22510 _keys!1717)))

(declare-fun b!972585 () Bool)

(declare-fun res!651005 () Bool)

(assert (=> b!972585 (=> (not res!651005) (not e!548198))))

(declare-datatypes ((List!20175 0))(
  ( (Nil!20172) (Cons!20171 (h!21333 (_ BitVec 64)) (t!28584 List!20175)) )
))
(declare-fun arrayNoDuplicates!0 (array!60465 (_ BitVec 32) List!20175) Bool)

(assert (=> b!972585 (= res!651005 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20172))))

(declare-fun b!972586 () Bool)

(declare-fun res!651011 () Bool)

(assert (=> b!972586 (=> (not res!651011) (not e!548198))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!972586 (= res!651011 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29575 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29575 _keys!1717))))))

(declare-fun b!972587 () Bool)

(declare-fun res!651008 () Bool)

(assert (=> b!972587 (=> (not res!651008) (not e!548198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60465 (_ BitVec 32)) Bool)

(assert (=> b!972587 (= res!651008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972588 () Bool)

(declare-fun e!548201 () Bool)

(assert (=> b!972588 (= e!548198 e!548201)))

(declare-fun res!651012 () Bool)

(assert (=> b!972588 (=> (not res!651012) (not e!548201))))

(declare-fun lt!432074 () (_ BitVec 64))

(assert (=> b!972588 (= res!651012 (validKeyInArray!0 lt!432074))))

(assert (=> b!972588 (= lt!432074 (select (arr!29096 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!14310 0))(
  ( (tuple2!14311 (_1!7166 (_ BitVec 64)) (_2!7166 V!34595)) )
))
(declare-datatypes ((List!20176 0))(
  ( (Nil!20173) (Cons!20172 (h!21334 tuple2!14310) (t!28585 List!20176)) )
))
(declare-datatypes ((ListLongMap!13007 0))(
  ( (ListLongMap!13008 (toList!6519 List!20176)) )
))
(declare-fun lt!432072 () ListLongMap!13007)

(declare-fun zeroValue!1367 () V!34595)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34595)

(declare-fun getCurrentListMap!3752 (array!60465 array!60467 (_ BitVec 32) (_ BitVec 32) V!34595 V!34595 (_ BitVec 32) Int) ListLongMap!13007)

(assert (=> b!972588 (= lt!432072 (getCurrentListMap!3752 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972589 () Bool)

(declare-fun mapRes!35323 () Bool)

(assert (=> b!972589 (= e!548200 (and e!548203 mapRes!35323))))

(declare-fun condMapEmpty!35323 () Bool)

(declare-fun mapDefault!35323 () ValueCell!10623)

(assert (=> b!972589 (= condMapEmpty!35323 (= (arr!29097 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10623)) mapDefault!35323)))))

(declare-fun mapIsEmpty!35323 () Bool)

(assert (=> mapIsEmpty!35323 mapRes!35323))

(declare-fun mapNonEmpty!35323 () Bool)

(declare-fun tp!67212 () Bool)

(assert (=> mapNonEmpty!35323 (= mapRes!35323 (and tp!67212 e!548202))))

(declare-fun mapRest!35323 () (Array (_ BitVec 32) ValueCell!10623))

(declare-fun mapValue!35323 () ValueCell!10623)

(declare-fun mapKey!35323 () (_ BitVec 32))

(assert (=> mapNonEmpty!35323 (= (arr!29097 _values!1425) (store mapRest!35323 mapKey!35323 mapValue!35323))))

(declare-fun b!972590 () Bool)

(declare-fun res!651006 () Bool)

(assert (=> b!972590 (=> (not res!651006) (not e!548198))))

(declare-fun contains!5613 (ListLongMap!13007 (_ BitVec 64)) Bool)

(assert (=> b!972590 (= res!651006 (contains!5613 (getCurrentListMap!3752 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29096 _keys!1717) i!822)))))

(declare-fun b!972591 () Bool)

(assert (=> b!972591 (= e!548201 (not true))))

(declare-fun +!2893 (ListLongMap!13007 tuple2!14310) ListLongMap!13007)

(declare-fun get!15076 (ValueCell!10623 V!34595) V!34595)

(declare-fun dynLambda!1682 (Int (_ BitVec 64)) V!34595)

(assert (=> b!972591 (= lt!432072 (+!2893 (getCurrentListMap!3752 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14311 lt!432074 (get!15076 (select (arr!29097 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1682 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32407 0))(
  ( (Unit!32408) )
))
(declare-fun lt!432073 () Unit!32407)

(declare-fun lemmaListMapRecursiveValidKeyArray!259 (array!60465 array!60467 (_ BitVec 32) (_ BitVec 32) V!34595 V!34595 (_ BitVec 32) Int) Unit!32407)

(assert (=> b!972591 (= lt!432073 (lemmaListMapRecursiveValidKeyArray!259 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(assert (= (and start!83318 res!651009) b!972583))

(assert (= (and b!972583 res!651010) b!972587))

(assert (= (and b!972587 res!651008) b!972585))

(assert (= (and b!972585 res!651005) b!972586))

(assert (= (and b!972586 res!651011) b!972581))

(assert (= (and b!972581 res!651007) b!972590))

(assert (= (and b!972590 res!651006) b!972588))

(assert (= (and b!972588 res!651012) b!972591))

(assert (= (and b!972589 condMapEmpty!35323) mapIsEmpty!35323))

(assert (= (and b!972589 (not condMapEmpty!35323)) mapNonEmpty!35323))

(get-info :version)

(assert (= (and mapNonEmpty!35323 ((_ is ValueCellFull!10623) mapValue!35323)) b!972582))

(assert (= (and b!972589 ((_ is ValueCellFull!10623) mapDefault!35323)) b!972584))

(assert (= start!83318 b!972589))

(declare-fun b_lambda!14475 () Bool)

(assert (=> (not b_lambda!14475) (not b!972591)))

(declare-fun t!28583 () Bool)

(declare-fun tb!6259 () Bool)

(assert (=> (and start!83318 (= defaultEntry!1428 defaultEntry!1428) t!28583) tb!6259))

(declare-fun result!12495 () Bool)

(assert (=> tb!6259 (= result!12495 tp_is_empty!22209)))

(assert (=> b!972591 t!28583))

(declare-fun b_and!30845 () Bool)

(assert (= b_and!30843 (and (=> t!28583 result!12495) b_and!30845)))

(declare-fun m!900003 () Bool)

(assert (=> b!972587 m!900003))

(declare-fun m!900005 () Bool)

(assert (=> b!972588 m!900005))

(declare-fun m!900007 () Bool)

(assert (=> b!972588 m!900007))

(declare-fun m!900009 () Bool)

(assert (=> b!972588 m!900009))

(declare-fun m!900011 () Bool)

(assert (=> b!972590 m!900011))

(declare-fun m!900013 () Bool)

(assert (=> b!972590 m!900013))

(assert (=> b!972590 m!900011))

(assert (=> b!972590 m!900013))

(declare-fun m!900015 () Bool)

(assert (=> b!972590 m!900015))

(declare-fun m!900017 () Bool)

(assert (=> start!83318 m!900017))

(declare-fun m!900019 () Bool)

(assert (=> start!83318 m!900019))

(declare-fun m!900021 () Bool)

(assert (=> start!83318 m!900021))

(assert (=> b!972581 m!900013))

(assert (=> b!972581 m!900013))

(declare-fun m!900023 () Bool)

(assert (=> b!972581 m!900023))

(declare-fun m!900025 () Bool)

(assert (=> mapNonEmpty!35323 m!900025))

(declare-fun m!900027 () Bool)

(assert (=> b!972585 m!900027))

(declare-fun m!900029 () Bool)

(assert (=> b!972591 m!900029))

(declare-fun m!900031 () Bool)

(assert (=> b!972591 m!900031))

(declare-fun m!900033 () Bool)

(assert (=> b!972591 m!900033))

(assert (=> b!972591 m!900031))

(declare-fun m!900035 () Bool)

(assert (=> b!972591 m!900035))

(assert (=> b!972591 m!900029))

(assert (=> b!972591 m!900033))

(declare-fun m!900037 () Bool)

(assert (=> b!972591 m!900037))

(declare-fun m!900039 () Bool)

(assert (=> b!972591 m!900039))

(check-sat (not b!972590) b_and!30845 (not b!972588) (not b_next!19311) (not start!83318) (not b!972591) (not b!972585) tp_is_empty!22209 (not b_lambda!14475) (not b!972581) (not b!972587) (not mapNonEmpty!35323))
(check-sat b_and!30845 (not b_next!19311))
