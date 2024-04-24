; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82822 () Bool)

(assert start!82822)

(declare-fun b_free!18787 () Bool)

(declare-fun b_next!18787 () Bool)

(assert (=> start!82822 (= b_free!18787 (not b_next!18787))))

(declare-fun tp!65482 () Bool)

(declare-fun b_and!30285 () Bool)

(assert (=> start!82822 (= tp!65482 b_and!30285)))

(declare-fun b!964461 () Bool)

(declare-fun e!543869 () Bool)

(declare-fun tp_is_empty!21589 () Bool)

(assert (=> b!964461 (= e!543869 tp_is_empty!21589)))

(declare-fun b!964462 () Bool)

(declare-fun res!645224 () Bool)

(declare-fun e!543868 () Bool)

(assert (=> b!964462 (=> (not res!645224) (not e!543868))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33769 0))(
  ( (V!33770 (val!10845 Int)) )
))
(declare-datatypes ((ValueCell!10313 0))(
  ( (ValueCellFull!10313 (v!13400 V!33769)) (EmptyCell!10313) )
))
(declare-datatypes ((array!59290 0))(
  ( (array!59291 (arr!28509 (Array (_ BitVec 32) ValueCell!10313)) (size!28989 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59290)

(declare-datatypes ((array!59292 0))(
  ( (array!59293 (arr!28510 (Array (_ BitVec 32) (_ BitVec 64))) (size!28990 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59292)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!964462 (= res!645224 (and (= (size!28989 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28990 _keys!1686) (size!28989 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964463 () Bool)

(declare-fun res!645226 () Bool)

(assert (=> b!964463 (=> (not res!645226) (not e!543868))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964463 (= res!645226 (bvsgt from!2084 newFrom!159))))

(declare-fun b!964464 () Bool)

(assert (=> b!964464 (= e!543868 (not true))))

(declare-fun minValue!1342 () V!33769)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33769)

(declare-datatypes ((tuple2!13920 0))(
  ( (tuple2!13921 (_1!6971 (_ BitVec 64)) (_2!6971 V!33769)) )
))
(declare-datatypes ((List!19767 0))(
  ( (Nil!19764) (Cons!19763 (h!20931 tuple2!13920) (t!28122 List!19767)) )
))
(declare-datatypes ((ListLongMap!12619 0))(
  ( (ListLongMap!12620 (toList!6325 List!19767)) )
))
(declare-fun contains!5440 (ListLongMap!12619 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3558 (array!59292 array!59290 (_ BitVec 32) (_ BitVec 32) V!33769 V!33769 (_ BitVec 32) Int) ListLongMap!12619)

(assert (=> b!964464 (contains!5440 (getCurrentListMap!3558 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28510 _keys!1686) i!803))))

(declare-datatypes ((Unit!32206 0))(
  ( (Unit!32207) )
))
(declare-fun lt!431345 () Unit!32206)

(declare-fun lemmaInListMapFromThenInFromMinusOne!17 (array!59292 array!59290 (_ BitVec 32) (_ BitVec 32) V!33769 V!33769 (_ BitVec 32) (_ BitVec 32) Int) Unit!32206)

(assert (=> b!964464 (= lt!431345 (lemmaInListMapFromThenInFromMinusOne!17 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964465 () Bool)

(declare-fun res!645225 () Bool)

(assert (=> b!964465 (=> (not res!645225) (not e!543868))))

(assert (=> b!964465 (= res!645225 (contains!5440 (getCurrentListMap!3558 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28510 _keys!1686) i!803)))))

(declare-fun b!964466 () Bool)

(declare-fun e!543871 () Bool)

(assert (=> b!964466 (= e!543871 tp_is_empty!21589)))

(declare-fun b!964467 () Bool)

(declare-fun res!645228 () Bool)

(assert (=> b!964467 (=> (not res!645228) (not e!543868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59292 (_ BitVec 32)) Bool)

(assert (=> b!964467 (= res!645228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964468 () Bool)

(declare-fun e!543872 () Bool)

(declare-fun mapRes!34378 () Bool)

(assert (=> b!964468 (= e!543872 (and e!543871 mapRes!34378))))

(declare-fun condMapEmpty!34378 () Bool)

(declare-fun mapDefault!34378 () ValueCell!10313)

(assert (=> b!964468 (= condMapEmpty!34378 (= (arr!28509 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10313)) mapDefault!34378)))))

(declare-fun b!964469 () Bool)

(declare-fun res!645227 () Bool)

(assert (=> b!964469 (=> (not res!645227) (not e!543868))))

(assert (=> b!964469 (= res!645227 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28990 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28990 _keys!1686))))))

(declare-fun mapNonEmpty!34378 () Bool)

(declare-fun tp!65481 () Bool)

(assert (=> mapNonEmpty!34378 (= mapRes!34378 (and tp!65481 e!543869))))

(declare-fun mapKey!34378 () (_ BitVec 32))

(declare-fun mapRest!34378 () (Array (_ BitVec 32) ValueCell!10313))

(declare-fun mapValue!34378 () ValueCell!10313)

(assert (=> mapNonEmpty!34378 (= (arr!28509 _values!1400) (store mapRest!34378 mapKey!34378 mapValue!34378))))

(declare-fun b!964470 () Bool)

(declare-fun res!645229 () Bool)

(assert (=> b!964470 (=> (not res!645229) (not e!543868))))

(declare-datatypes ((List!19768 0))(
  ( (Nil!19765) (Cons!19764 (h!20932 (_ BitVec 64)) (t!28123 List!19768)) )
))
(declare-fun arrayNoDuplicates!0 (array!59292 (_ BitVec 32) List!19768) Bool)

(assert (=> b!964470 (= res!645229 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19765))))

(declare-fun b!964471 () Bool)

(declare-fun res!645231 () Bool)

(assert (=> b!964471 (=> (not res!645231) (not e!543868))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964471 (= res!645231 (validKeyInArray!0 (select (arr!28510 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34378 () Bool)

(assert (=> mapIsEmpty!34378 mapRes!34378))

(declare-fun res!645230 () Bool)

(assert (=> start!82822 (=> (not res!645230) (not e!543868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82822 (= res!645230 (validMask!0 mask!2110))))

(assert (=> start!82822 e!543868))

(assert (=> start!82822 true))

(declare-fun array_inv!22151 (array!59290) Bool)

(assert (=> start!82822 (and (array_inv!22151 _values!1400) e!543872)))

(declare-fun array_inv!22152 (array!59292) Bool)

(assert (=> start!82822 (array_inv!22152 _keys!1686)))

(assert (=> start!82822 tp!65482))

(assert (=> start!82822 tp_is_empty!21589))

(assert (= (and start!82822 res!645230) b!964462))

(assert (= (and b!964462 res!645224) b!964467))

(assert (= (and b!964467 res!645228) b!964470))

(assert (= (and b!964470 res!645229) b!964469))

(assert (= (and b!964469 res!645227) b!964471))

(assert (= (and b!964471 res!645231) b!964465))

(assert (= (and b!964465 res!645225) b!964463))

(assert (= (and b!964463 res!645226) b!964464))

(assert (= (and b!964468 condMapEmpty!34378) mapIsEmpty!34378))

(assert (= (and b!964468 (not condMapEmpty!34378)) mapNonEmpty!34378))

(get-info :version)

(assert (= (and mapNonEmpty!34378 ((_ is ValueCellFull!10313) mapValue!34378)) b!964461))

(assert (= (and b!964468 ((_ is ValueCellFull!10313) mapDefault!34378)) b!964466))

(assert (= start!82822 b!964468))

(declare-fun m!894247 () Bool)

(assert (=> b!964465 m!894247))

(declare-fun m!894249 () Bool)

(assert (=> b!964465 m!894249))

(assert (=> b!964465 m!894247))

(assert (=> b!964465 m!894249))

(declare-fun m!894251 () Bool)

(assert (=> b!964465 m!894251))

(declare-fun m!894253 () Bool)

(assert (=> b!964470 m!894253))

(declare-fun m!894255 () Bool)

(assert (=> b!964467 m!894255))

(declare-fun m!894257 () Bool)

(assert (=> start!82822 m!894257))

(declare-fun m!894259 () Bool)

(assert (=> start!82822 m!894259))

(declare-fun m!894261 () Bool)

(assert (=> start!82822 m!894261))

(declare-fun m!894263 () Bool)

(assert (=> b!964464 m!894263))

(assert (=> b!964464 m!894249))

(assert (=> b!964464 m!894263))

(assert (=> b!964464 m!894249))

(declare-fun m!894265 () Bool)

(assert (=> b!964464 m!894265))

(declare-fun m!894267 () Bool)

(assert (=> b!964464 m!894267))

(assert (=> b!964471 m!894249))

(assert (=> b!964471 m!894249))

(declare-fun m!894269 () Bool)

(assert (=> b!964471 m!894269))

(declare-fun m!894271 () Bool)

(assert (=> mapNonEmpty!34378 m!894271))

(check-sat b_and!30285 tp_is_empty!21589 (not b!964465) (not b!964470) (not b_next!18787) (not start!82822) (not b!964467) (not b!964471) (not b!964464) (not mapNonEmpty!34378))
(check-sat b_and!30285 (not b_next!18787))
