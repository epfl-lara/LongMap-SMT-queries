; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134120 () Bool)

(assert start!134120)

(declare-fun b_free!32071 () Bool)

(declare-fun b_next!32071 () Bool)

(assert (=> start!134120 (= b_free!32071 (not b_next!32071))))

(declare-fun tp!113418 () Bool)

(declare-fun b_and!51643 () Bool)

(assert (=> start!134120 (= tp!113418 b_and!51643)))

(declare-fun res!1069636 () Bool)

(declare-fun e!872803 () Bool)

(assert (=> start!134120 (=> (not res!1069636) (not e!872803))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134120 (= res!1069636 (validMask!0 mask!947))))

(assert (=> start!134120 e!872803))

(assert (=> start!134120 tp!113418))

(declare-fun tp_is_empty!38791 () Bool)

(assert (=> start!134120 tp_is_empty!38791))

(assert (=> start!134120 true))

(declare-datatypes ((array!104404 0))(
  ( (array!104405 (arr!50387 (Array (_ BitVec 32) (_ BitVec 64))) (size!50938 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104404)

(declare-fun array_inv!39403 (array!104404) Bool)

(assert (=> start!134120 (array_inv!39403 _keys!637)))

(declare-datatypes ((V!59929 0))(
  ( (V!59930 (val!19479 Int)) )
))
(declare-datatypes ((ValueCell!18365 0))(
  ( (ValueCellFull!18365 (v!22223 V!59929)) (EmptyCell!18365) )
))
(declare-datatypes ((array!104406 0))(
  ( (array!104407 (arr!50388 (Array (_ BitVec 32) ValueCell!18365)) (size!50939 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104406)

(declare-fun e!872801 () Bool)

(declare-fun array_inv!39404 (array!104406) Bool)

(assert (=> start!134120 (and (array_inv!39404 _values!487) e!872801)))

(declare-fun b!1565771 () Bool)

(declare-fun res!1069632 () Bool)

(assert (=> b!1565771 (=> (not res!1069632) (not e!872803))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1565771 (= res!1069632 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50938 _keys!637)) (bvslt from!782 (size!50938 _keys!637))))))

(declare-fun mapNonEmpty!59562 () Bool)

(declare-fun mapRes!59562 () Bool)

(declare-fun tp!113417 () Bool)

(declare-fun e!872800 () Bool)

(assert (=> mapNonEmpty!59562 (= mapRes!59562 (and tp!113417 e!872800))))

(declare-fun mapKey!59562 () (_ BitVec 32))

(declare-fun mapValue!59562 () ValueCell!18365)

(declare-fun mapRest!59562 () (Array (_ BitVec 32) ValueCell!18365))

(assert (=> mapNonEmpty!59562 (= (arr!50388 _values!487) (store mapRest!59562 mapKey!59562 mapValue!59562))))

(declare-fun b!1565772 () Bool)

(declare-fun res!1069637 () Bool)

(assert (=> b!1565772 (=> (not res!1069637) (not e!872803))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1565772 (= res!1069637 (and (= (size!50939 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50938 _keys!637) (size!50939 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565773 () Bool)

(declare-fun res!1069634 () Bool)

(assert (=> b!1565773 (=> (not res!1069634) (not e!872803))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104404 (_ BitVec 32)) Bool)

(assert (=> b!1565773 (= res!1069634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565774 () Bool)

(declare-fun e!872802 () Bool)

(assert (=> b!1565774 (= e!872801 (and e!872802 mapRes!59562))))

(declare-fun condMapEmpty!59562 () Bool)

(declare-fun mapDefault!59562 () ValueCell!18365)

(assert (=> b!1565774 (= condMapEmpty!59562 (= (arr!50388 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18365)) mapDefault!59562)))))

(declare-fun mapIsEmpty!59562 () Bool)

(assert (=> mapIsEmpty!59562 mapRes!59562))

(declare-fun b!1565775 () Bool)

(declare-fun e!872799 () Bool)

(assert (=> b!1565775 (= e!872803 e!872799)))

(declare-fun res!1069631 () Bool)

(assert (=> b!1565775 (=> (not res!1069631) (not e!872799))))

(declare-datatypes ((tuple2!25190 0))(
  ( (tuple2!25191 (_1!12606 (_ BitVec 64)) (_2!12606 V!59929)) )
))
(declare-datatypes ((List!36554 0))(
  ( (Nil!36551) (Cons!36550 (h!38014 tuple2!25190) (t!51393 List!36554)) )
))
(declare-datatypes ((ListLongMap!22633 0))(
  ( (ListLongMap!22634 (toList!11332 List!36554)) )
))
(declare-fun lt!672776 () ListLongMap!22633)

(declare-fun contains!10333 (ListLongMap!22633 (_ BitVec 64)) Bool)

(assert (=> b!1565775 (= res!1069631 (not (contains!10333 lt!672776 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59929)

(declare-fun minValue!453 () V!59929)

(declare-fun getCurrentListMapNoExtraKeys!6729 (array!104404 array!104406 (_ BitVec 32) (_ BitVec 32) V!59929 V!59929 (_ BitVec 32) Int) ListLongMap!22633)

(assert (=> b!1565775 (= lt!672776 (getCurrentListMapNoExtraKeys!6729 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1565776 () Bool)

(assert (=> b!1565776 (= e!872799 false)))

(declare-fun lt!672775 () Bool)

(assert (=> b!1565776 (= lt!672775 (contains!10333 lt!672776 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1565777 () Bool)

(declare-fun res!1069635 () Bool)

(assert (=> b!1565777 (=> (not res!1069635) (not e!872803))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565777 (= res!1069635 (not (validKeyInArray!0 (select (arr!50387 _keys!637) from!782))))))

(declare-fun b!1565778 () Bool)

(declare-fun res!1069633 () Bool)

(assert (=> b!1565778 (=> (not res!1069633) (not e!872803))))

(declare-datatypes ((List!36555 0))(
  ( (Nil!36552) (Cons!36551 (h!38015 (_ BitVec 64)) (t!51394 List!36555)) )
))
(declare-fun arrayNoDuplicates!0 (array!104404 (_ BitVec 32) List!36555) Bool)

(assert (=> b!1565778 (= res!1069633 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36552))))

(declare-fun b!1565779 () Bool)

(assert (=> b!1565779 (= e!872802 tp_is_empty!38791)))

(declare-fun b!1565780 () Bool)

(assert (=> b!1565780 (= e!872800 tp_is_empty!38791)))

(assert (= (and start!134120 res!1069636) b!1565772))

(assert (= (and b!1565772 res!1069637) b!1565773))

(assert (= (and b!1565773 res!1069634) b!1565778))

(assert (= (and b!1565778 res!1069633) b!1565771))

(assert (= (and b!1565771 res!1069632) b!1565777))

(assert (= (and b!1565777 res!1069635) b!1565775))

(assert (= (and b!1565775 res!1069631) b!1565776))

(assert (= (and b!1565774 condMapEmpty!59562) mapIsEmpty!59562))

(assert (= (and b!1565774 (not condMapEmpty!59562)) mapNonEmpty!59562))

(get-info :version)

(assert (= (and mapNonEmpty!59562 ((_ is ValueCellFull!18365) mapValue!59562)) b!1565780))

(assert (= (and b!1565774 ((_ is ValueCellFull!18365) mapDefault!59562)) b!1565779))

(assert (= start!134120 b!1565774))

(declare-fun m!1441143 () Bool)

(assert (=> b!1565777 m!1441143))

(assert (=> b!1565777 m!1441143))

(declare-fun m!1441145 () Bool)

(assert (=> b!1565777 m!1441145))

(declare-fun m!1441147 () Bool)

(assert (=> mapNonEmpty!59562 m!1441147))

(declare-fun m!1441149 () Bool)

(assert (=> b!1565778 m!1441149))

(declare-fun m!1441151 () Bool)

(assert (=> b!1565775 m!1441151))

(declare-fun m!1441153 () Bool)

(assert (=> b!1565775 m!1441153))

(declare-fun m!1441155 () Bool)

(assert (=> b!1565776 m!1441155))

(declare-fun m!1441157 () Bool)

(assert (=> start!134120 m!1441157))

(declare-fun m!1441159 () Bool)

(assert (=> start!134120 m!1441159))

(declare-fun m!1441161 () Bool)

(assert (=> start!134120 m!1441161))

(declare-fun m!1441163 () Bool)

(assert (=> b!1565773 m!1441163))

(check-sat (not start!134120) (not b!1565776) (not b!1565775) tp_is_empty!38791 (not b!1565778) (not b!1565773) (not b_next!32071) (not mapNonEmpty!59562) (not b!1565777) b_and!51643)
(check-sat b_and!51643 (not b_next!32071))
