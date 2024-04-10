; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82584 () Bool)

(assert start!82584)

(declare-fun b_free!18717 () Bool)

(declare-fun b_next!18717 () Bool)

(assert (=> start!82584 (= b_free!18717 (not b_next!18717))))

(declare-fun tp!65271 () Bool)

(declare-fun b_and!30205 () Bool)

(assert (=> start!82584 (= tp!65271 b_and!30205)))

(declare-fun b!962465 () Bool)

(declare-fun e!542762 () Bool)

(declare-fun e!542765 () Bool)

(declare-fun mapRes!34273 () Bool)

(assert (=> b!962465 (= e!542762 (and e!542765 mapRes!34273))))

(declare-fun condMapEmpty!34273 () Bool)

(declare-datatypes ((V!33675 0))(
  ( (V!33676 (val!10810 Int)) )
))
(declare-datatypes ((ValueCell!10278 0))(
  ( (ValueCellFull!10278 (v!13368 V!33675)) (EmptyCell!10278) )
))
(declare-datatypes ((array!59135 0))(
  ( (array!59136 (arr!28436 (Array (_ BitVec 32) ValueCell!10278)) (size!28915 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59135)

(declare-fun mapDefault!34273 () ValueCell!10278)

(assert (=> b!962465 (= condMapEmpty!34273 (= (arr!28436 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10278)) mapDefault!34273)))))

(declare-fun b!962466 () Bool)

(declare-fun res!644105 () Bool)

(declare-fun e!542761 () Bool)

(assert (=> b!962466 (=> (not res!644105) (not e!542761))))

(declare-datatypes ((array!59137 0))(
  ( (array!59138 (arr!28437 (Array (_ BitVec 32) (_ BitVec 64))) (size!28916 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59137)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962466 (= res!644105 (validKeyInArray!0 (select (arr!28437 _keys!1686) i!803)))))

(declare-fun b!962467 () Bool)

(declare-fun res!644106 () Bool)

(assert (=> b!962467 (=> (not res!644106) (not e!542761))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!962467 (= res!644106 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28916 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28916 _keys!1686))))))

(declare-fun b!962468 () Bool)

(declare-fun res!644104 () Bool)

(assert (=> b!962468 (=> (not res!644104) (not e!542761))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59137 (_ BitVec 32)) Bool)

(assert (=> b!962468 (= res!644104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962469 () Bool)

(declare-fun e!542764 () Bool)

(declare-fun tp_is_empty!21519 () Bool)

(assert (=> b!962469 (= e!542764 tp_is_empty!21519)))

(declare-fun b!962470 () Bool)

(assert (=> b!962470 (= e!542761 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33675)

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!430879 () Bool)

(declare-fun zeroValue!1342 () V!33675)

(declare-datatypes ((tuple2!13882 0))(
  ( (tuple2!13883 (_1!6952 (_ BitVec 64)) (_2!6952 V!33675)) )
))
(declare-datatypes ((List!19733 0))(
  ( (Nil!19730) (Cons!19729 (h!20891 tuple2!13882) (t!28096 List!19733)) )
))
(declare-datatypes ((ListLongMap!12579 0))(
  ( (ListLongMap!12580 (toList!6305 List!19733)) )
))
(declare-fun contains!5408 (ListLongMap!12579 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3538 (array!59137 array!59135 (_ BitVec 32) (_ BitVec 32) V!33675 V!33675 (_ BitVec 32) Int) ListLongMap!12579)

(assert (=> b!962470 (= lt!430879 (contains!5408 (getCurrentListMap!3538 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28437 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34273 () Bool)

(declare-fun tp!65270 () Bool)

(assert (=> mapNonEmpty!34273 (= mapRes!34273 (and tp!65270 e!542764))))

(declare-fun mapKey!34273 () (_ BitVec 32))

(declare-fun mapRest!34273 () (Array (_ BitVec 32) ValueCell!10278))

(declare-fun mapValue!34273 () ValueCell!10278)

(assert (=> mapNonEmpty!34273 (= (arr!28436 _values!1400) (store mapRest!34273 mapKey!34273 mapValue!34273))))

(declare-fun res!644107 () Bool)

(assert (=> start!82584 (=> (not res!644107) (not e!542761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82584 (= res!644107 (validMask!0 mask!2110))))

(assert (=> start!82584 e!542761))

(assert (=> start!82584 true))

(declare-fun array_inv!22033 (array!59135) Bool)

(assert (=> start!82584 (and (array_inv!22033 _values!1400) e!542762)))

(declare-fun array_inv!22034 (array!59137) Bool)

(assert (=> start!82584 (array_inv!22034 _keys!1686)))

(assert (=> start!82584 tp!65271))

(assert (=> start!82584 tp_is_empty!21519))

(declare-fun b!962471 () Bool)

(assert (=> b!962471 (= e!542765 tp_is_empty!21519)))

(declare-fun mapIsEmpty!34273 () Bool)

(assert (=> mapIsEmpty!34273 mapRes!34273))

(declare-fun b!962472 () Bool)

(declare-fun res!644103 () Bool)

(assert (=> b!962472 (=> (not res!644103) (not e!542761))))

(declare-datatypes ((List!19734 0))(
  ( (Nil!19731) (Cons!19730 (h!20892 (_ BitVec 64)) (t!28097 List!19734)) )
))
(declare-fun arrayNoDuplicates!0 (array!59137 (_ BitVec 32) List!19734) Bool)

(assert (=> b!962472 (= res!644103 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19731))))

(declare-fun b!962473 () Bool)

(declare-fun res!644102 () Bool)

(assert (=> b!962473 (=> (not res!644102) (not e!542761))))

(assert (=> b!962473 (= res!644102 (and (= (size!28915 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28916 _keys!1686) (size!28915 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82584 res!644107) b!962473))

(assert (= (and b!962473 res!644102) b!962468))

(assert (= (and b!962468 res!644104) b!962472))

(assert (= (and b!962472 res!644103) b!962467))

(assert (= (and b!962467 res!644106) b!962466))

(assert (= (and b!962466 res!644105) b!962470))

(assert (= (and b!962465 condMapEmpty!34273) mapIsEmpty!34273))

(assert (= (and b!962465 (not condMapEmpty!34273)) mapNonEmpty!34273))

(get-info :version)

(assert (= (and mapNonEmpty!34273 ((_ is ValueCellFull!10278) mapValue!34273)) b!962469))

(assert (= (and b!962465 ((_ is ValueCellFull!10278) mapDefault!34273)) b!962471))

(assert (= start!82584 b!962465))

(declare-fun m!892109 () Bool)

(assert (=> b!962470 m!892109))

(declare-fun m!892111 () Bool)

(assert (=> b!962470 m!892111))

(assert (=> b!962470 m!892109))

(assert (=> b!962470 m!892111))

(declare-fun m!892113 () Bool)

(assert (=> b!962470 m!892113))

(declare-fun m!892115 () Bool)

(assert (=> start!82584 m!892115))

(declare-fun m!892117 () Bool)

(assert (=> start!82584 m!892117))

(declare-fun m!892119 () Bool)

(assert (=> start!82584 m!892119))

(assert (=> b!962466 m!892111))

(assert (=> b!962466 m!892111))

(declare-fun m!892121 () Bool)

(assert (=> b!962466 m!892121))

(declare-fun m!892123 () Bool)

(assert (=> mapNonEmpty!34273 m!892123))

(declare-fun m!892125 () Bool)

(assert (=> b!962468 m!892125))

(declare-fun m!892127 () Bool)

(assert (=> b!962472 m!892127))

(check-sat b_and!30205 (not b!962472) (not mapNonEmpty!34273) (not b!962466) (not b!962470) (not b_next!18717) (not start!82584) tp_is_empty!21519 (not b!962468))
(check-sat b_and!30205 (not b_next!18717))
