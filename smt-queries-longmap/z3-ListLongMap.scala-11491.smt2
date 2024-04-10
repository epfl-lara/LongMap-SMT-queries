; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133746 () Bool)

(assert start!133746)

(declare-fun b_free!32109 () Bool)

(declare-fun b_next!32109 () Bool)

(assert (=> start!133746 (= b_free!32109 (not b_next!32109))))

(declare-fun tp!113531 () Bool)

(declare-fun b_and!51679 () Bool)

(assert (=> start!133746 (= tp!113531 b_and!51679)))

(declare-fun res!1069175 () Bool)

(declare-fun e!871636 () Bool)

(assert (=> start!133746 (=> (not res!1069175) (not e!871636))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133746 (= res!1069175 (validMask!0 mask!947))))

(assert (=> start!133746 e!871636))

(assert (=> start!133746 tp!113531))

(declare-fun tp_is_empty!38829 () Bool)

(assert (=> start!133746 tp_is_empty!38829))

(assert (=> start!133746 true))

(declare-datatypes ((array!104350 0))(
  ( (array!104351 (arr!50367 (Array (_ BitVec 32) (_ BitVec 64))) (size!50917 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104350)

(declare-fun array_inv!39141 (array!104350) Bool)

(assert (=> start!133746 (array_inv!39141 _keys!637)))

(declare-datatypes ((V!59979 0))(
  ( (V!59980 (val!19498 Int)) )
))
(declare-datatypes ((ValueCell!18384 0))(
  ( (ValueCellFull!18384 (v!22250 V!59979)) (EmptyCell!18384) )
))
(declare-datatypes ((array!104352 0))(
  ( (array!104353 (arr!50368 (Array (_ BitVec 32) ValueCell!18384)) (size!50918 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104352)

(declare-fun e!871635 () Bool)

(declare-fun array_inv!39142 (array!104352) Bool)

(assert (=> start!133746 (and (array_inv!39142 _values!487) e!871635)))

(declare-fun b!1563905 () Bool)

(declare-fun e!871634 () Bool)

(assert (=> b!1563905 (= e!871634 tp_is_empty!38829)))

(declare-fun b!1563906 () Bool)

(declare-fun res!1069174 () Bool)

(assert (=> b!1563906 (=> (not res!1069174) (not e!871636))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563906 (= res!1069174 (not (validKeyInArray!0 (select (arr!50367 _keys!637) from!782))))))

(declare-fun b!1563907 () Bool)

(declare-fun e!871632 () Bool)

(assert (=> b!1563907 (= e!871636 e!871632)))

(declare-fun res!1069176 () Bool)

(assert (=> b!1563907 (=> (not res!1069176) (not e!871632))))

(declare-datatypes ((tuple2!25156 0))(
  ( (tuple2!25157 (_1!12589 (_ BitVec 64)) (_2!12589 V!59979)) )
))
(declare-datatypes ((List!36542 0))(
  ( (Nil!36539) (Cons!36538 (h!37984 tuple2!25156) (t!51389 List!36542)) )
))
(declare-datatypes ((ListLongMap!22591 0))(
  ( (ListLongMap!22592 (toList!11311 List!36542)) )
))
(declare-fun lt!671981 () ListLongMap!22591)

(declare-fun contains!10301 (ListLongMap!22591 (_ BitVec 64)) Bool)

(assert (=> b!1563907 (= res!1069176 (not (contains!10301 lt!671981 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59979)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59979)

(declare-fun getCurrentListMapNoExtraKeys!6693 (array!104350 array!104352 (_ BitVec 32) (_ BitVec 32) V!59979 V!59979 (_ BitVec 32) Int) ListLongMap!22591)

(assert (=> b!1563907 (= lt!671981 (getCurrentListMapNoExtraKeys!6693 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapNonEmpty!59619 () Bool)

(declare-fun mapRes!59619 () Bool)

(declare-fun tp!113532 () Bool)

(assert (=> mapNonEmpty!59619 (= mapRes!59619 (and tp!113532 e!871634))))

(declare-fun mapKey!59619 () (_ BitVec 32))

(declare-fun mapValue!59619 () ValueCell!18384)

(declare-fun mapRest!59619 () (Array (_ BitVec 32) ValueCell!18384))

(assert (=> mapNonEmpty!59619 (= (arr!50368 _values!487) (store mapRest!59619 mapKey!59619 mapValue!59619))))

(declare-fun b!1563908 () Bool)

(assert (=> b!1563908 (= e!871632 false)))

(declare-fun lt!671982 () Bool)

(assert (=> b!1563908 (= lt!671982 (contains!10301 lt!671981 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1563909 () Bool)

(declare-fun e!871631 () Bool)

(assert (=> b!1563909 (= e!871635 (and e!871631 mapRes!59619))))

(declare-fun condMapEmpty!59619 () Bool)

(declare-fun mapDefault!59619 () ValueCell!18384)

(assert (=> b!1563909 (= condMapEmpty!59619 (= (arr!50368 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18384)) mapDefault!59619)))))

(declare-fun b!1563910 () Bool)

(declare-fun res!1069172 () Bool)

(assert (=> b!1563910 (=> (not res!1069172) (not e!871636))))

(declare-datatypes ((List!36543 0))(
  ( (Nil!36540) (Cons!36539 (h!37985 (_ BitVec 64)) (t!51390 List!36543)) )
))
(declare-fun arrayNoDuplicates!0 (array!104350 (_ BitVec 32) List!36543) Bool)

(assert (=> b!1563910 (= res!1069172 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36540))))

(declare-fun mapIsEmpty!59619 () Bool)

(assert (=> mapIsEmpty!59619 mapRes!59619))

(declare-fun b!1563911 () Bool)

(assert (=> b!1563911 (= e!871631 tp_is_empty!38829)))

(declare-fun b!1563912 () Bool)

(declare-fun res!1069173 () Bool)

(assert (=> b!1563912 (=> (not res!1069173) (not e!871636))))

(assert (=> b!1563912 (= res!1069173 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50917 _keys!637)) (bvslt from!782 (size!50917 _keys!637))))))

(declare-fun b!1563913 () Bool)

(declare-fun res!1069170 () Bool)

(assert (=> b!1563913 (=> (not res!1069170) (not e!871636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104350 (_ BitVec 32)) Bool)

(assert (=> b!1563913 (= res!1069170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563914 () Bool)

(declare-fun res!1069171 () Bool)

(assert (=> b!1563914 (=> (not res!1069171) (not e!871636))))

(assert (=> b!1563914 (= res!1069171 (and (= (size!50918 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50917 _keys!637) (size!50918 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(assert (= (and start!133746 res!1069175) b!1563914))

(assert (= (and b!1563914 res!1069171) b!1563913))

(assert (= (and b!1563913 res!1069170) b!1563910))

(assert (= (and b!1563910 res!1069172) b!1563912))

(assert (= (and b!1563912 res!1069173) b!1563906))

(assert (= (and b!1563906 res!1069174) b!1563907))

(assert (= (and b!1563907 res!1069176) b!1563908))

(assert (= (and b!1563909 condMapEmpty!59619) mapIsEmpty!59619))

(assert (= (and b!1563909 (not condMapEmpty!59619)) mapNonEmpty!59619))

(get-info :version)

(assert (= (and mapNonEmpty!59619 ((_ is ValueCellFull!18384) mapValue!59619)) b!1563905))

(assert (= (and b!1563909 ((_ is ValueCellFull!18384) mapDefault!59619)) b!1563911))

(assert (= start!133746 b!1563909))

(declare-fun m!1439303 () Bool)

(assert (=> b!1563908 m!1439303))

(declare-fun m!1439305 () Bool)

(assert (=> b!1563910 m!1439305))

(declare-fun m!1439307 () Bool)

(assert (=> b!1563906 m!1439307))

(assert (=> b!1563906 m!1439307))

(declare-fun m!1439309 () Bool)

(assert (=> b!1563906 m!1439309))

(declare-fun m!1439311 () Bool)

(assert (=> b!1563913 m!1439311))

(declare-fun m!1439313 () Bool)

(assert (=> mapNonEmpty!59619 m!1439313))

(declare-fun m!1439315 () Bool)

(assert (=> b!1563907 m!1439315))

(declare-fun m!1439317 () Bool)

(assert (=> b!1563907 m!1439317))

(declare-fun m!1439319 () Bool)

(assert (=> start!133746 m!1439319))

(declare-fun m!1439321 () Bool)

(assert (=> start!133746 m!1439321))

(declare-fun m!1439323 () Bool)

(assert (=> start!133746 m!1439323))

(check-sat (not start!133746) tp_is_empty!38829 b_and!51679 (not b!1563910) (not b!1563913) (not b_next!32109) (not b!1563906) (not b!1563907) (not mapNonEmpty!59619) (not b!1563908))
(check-sat b_and!51679 (not b_next!32109))
