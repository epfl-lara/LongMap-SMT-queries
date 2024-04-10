; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134064 () Bool)

(assert start!134064)

(declare-fun b_free!32191 () Bool)

(declare-fun b_next!32191 () Bool)

(assert (=> start!134064 (= b_free!32191 (not b_next!32191))))

(declare-fun tp!113892 () Bool)

(declare-fun b_and!51835 () Bool)

(assert (=> start!134064 (= tp!113892 b_and!51835)))

(declare-fun mapNonEmpty!59856 () Bool)

(declare-fun mapRes!59856 () Bool)

(declare-fun tp!113891 () Bool)

(declare-fun e!873368 () Bool)

(assert (=> mapNonEmpty!59856 (= mapRes!59856 (and tp!113891 e!873368))))

(declare-datatypes ((V!60169 0))(
  ( (V!60170 (val!19569 Int)) )
))
(declare-datatypes ((ValueCell!18455 0))(
  ( (ValueCellFull!18455 (v!22328 V!60169)) (EmptyCell!18455) )
))
(declare-fun mapRest!59856 () (Array (_ BitVec 32) ValueCell!18455))

(declare-fun mapValue!59856 () ValueCell!18455)

(declare-fun mapKey!59856 () (_ BitVec 32))

(declare-datatypes ((array!104632 0))(
  ( (array!104633 (arr!50501 (Array (_ BitVec 32) ValueCell!18455)) (size!51051 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104632)

(assert (=> mapNonEmpty!59856 (= (arr!50501 _values!487) (store mapRest!59856 mapKey!59856 mapValue!59856))))

(declare-fun b!1566823 () Bool)

(declare-fun res!1070855 () Bool)

(declare-fun e!873373 () Bool)

(assert (=> b!1566823 (=> (not res!1070855) (not e!873373))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104634 0))(
  ( (array!104635 (arr!50502 (Array (_ BitVec 32) (_ BitVec 64))) (size!51052 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104634)

(assert (=> b!1566823 (= res!1070855 (and (= (size!51051 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51052 _keys!637) (size!51051 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1566824 () Bool)

(declare-fun tp_is_empty!38971 () Bool)

(assert (=> b!1566824 (= e!873368 tp_is_empty!38971)))

(declare-fun b!1566825 () Bool)

(declare-fun e!873372 () Bool)

(assert (=> b!1566825 (= e!873373 e!873372)))

(declare-fun res!1070857 () Bool)

(assert (=> b!1566825 (=> (not res!1070857) (not e!873372))))

(declare-datatypes ((tuple2!25246 0))(
  ( (tuple2!25247 (_1!12634 (_ BitVec 64)) (_2!12634 V!60169)) )
))
(declare-datatypes ((List!36635 0))(
  ( (Nil!36632) (Cons!36631 (h!38078 tuple2!25246) (t!51539 List!36635)) )
))
(declare-datatypes ((ListLongMap!22681 0))(
  ( (ListLongMap!22682 (toList!11356 List!36635)) )
))
(declare-fun lt!672808 () ListLongMap!22681)

(declare-fun contains!10350 (ListLongMap!22681 (_ BitVec 64)) Bool)

(assert (=> b!1566825 (= res!1070857 (not (contains!10350 lt!672808 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60169)

(declare-fun minValue!453 () V!60169)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6721 (array!104634 array!104632 (_ BitVec 32) (_ BitVec 32) V!60169 V!60169 (_ BitVec 32) Int) ListLongMap!22681)

(assert (=> b!1566825 (= lt!672808 (getCurrentListMapNoExtraKeys!6721 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1566826 () Bool)

(declare-fun res!1070851 () Bool)

(assert (=> b!1566826 (=> (not res!1070851) (not e!873373))))

(assert (=> b!1566826 (= res!1070851 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51052 _keys!637)) (bvslt from!782 (size!51052 _keys!637))))))

(declare-fun res!1070852 () Bool)

(assert (=> start!134064 (=> (not res!1070852) (not e!873373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134064 (= res!1070852 (validMask!0 mask!947))))

(assert (=> start!134064 e!873373))

(assert (=> start!134064 tp!113892))

(assert (=> start!134064 tp_is_empty!38971))

(assert (=> start!134064 true))

(declare-fun array_inv!39239 (array!104634) Bool)

(assert (=> start!134064 (array_inv!39239 _keys!637)))

(declare-fun e!873370 () Bool)

(declare-fun array_inv!39240 (array!104632) Bool)

(assert (=> start!134064 (and (array_inv!39240 _values!487) e!873370)))

(declare-fun b!1566827 () Bool)

(declare-fun res!1070853 () Bool)

(assert (=> b!1566827 (=> (not res!1070853) (not e!873373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104634 (_ BitVec 32)) Bool)

(assert (=> b!1566827 (= res!1070853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1566828 () Bool)

(assert (=> b!1566828 (= e!873372 false)))

(declare-fun lt!672809 () Bool)

(assert (=> b!1566828 (= lt!672809 (contains!10350 lt!672808 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566829 () Bool)

(declare-fun e!873371 () Bool)

(assert (=> b!1566829 (= e!873371 tp_is_empty!38971)))

(declare-fun b!1566830 () Bool)

(declare-fun res!1070854 () Bool)

(assert (=> b!1566830 (=> (not res!1070854) (not e!873373))))

(declare-datatypes ((List!36636 0))(
  ( (Nil!36633) (Cons!36632 (h!38079 (_ BitVec 64)) (t!51540 List!36636)) )
))
(declare-fun arrayNoDuplicates!0 (array!104634 (_ BitVec 32) List!36636) Bool)

(assert (=> b!1566830 (= res!1070854 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36633))))

(declare-fun b!1566831 () Bool)

(assert (=> b!1566831 (= e!873370 (and e!873371 mapRes!59856))))

(declare-fun condMapEmpty!59856 () Bool)

(declare-fun mapDefault!59856 () ValueCell!18455)

