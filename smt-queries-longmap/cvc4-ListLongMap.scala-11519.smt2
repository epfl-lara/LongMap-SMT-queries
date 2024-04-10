; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134092 () Bool)

(assert start!134092)

(declare-fun b_free!32219 () Bool)

(declare-fun b_next!32219 () Bool)

(assert (=> start!134092 (= b_free!32219 (not b_next!32219))))

(declare-fun tp!113976 () Bool)

(declare-fun b_and!51863 () Bool)

(assert (=> start!134092 (= tp!113976 b_and!51863)))

(declare-fun mapIsEmpty!59898 () Bool)

(declare-fun mapRes!59898 () Bool)

(assert (=> mapIsEmpty!59898 mapRes!59898))

(declare-fun b!1567251 () Bool)

(declare-fun e!873625 () Bool)

(declare-fun e!873623 () Bool)

(assert (=> b!1567251 (= e!873625 e!873623)))

(declare-fun res!1071153 () Bool)

(assert (=> b!1567251 (=> (not res!1071153) (not e!873623))))

(declare-datatypes ((V!60205 0))(
  ( (V!60206 (val!19583 Int)) )
))
(declare-datatypes ((tuple2!25268 0))(
  ( (tuple2!25269 (_1!12645 (_ BitVec 64)) (_2!12645 V!60205)) )
))
(declare-datatypes ((List!36654 0))(
  ( (Nil!36651) (Cons!36650 (h!38097 tuple2!25268) (t!51558 List!36654)) )
))
(declare-datatypes ((ListLongMap!22703 0))(
  ( (ListLongMap!22704 (toList!11367 List!36654)) )
))
(declare-fun lt!672884 () ListLongMap!22703)

(declare-fun contains!10361 (ListLongMap!22703 (_ BitVec 64)) Bool)

(assert (=> b!1567251 (= res!1071153 (not (contains!10361 lt!672884 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60205)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun minValue!453 () V!60205)

(declare-datatypes ((array!104686 0))(
  ( (array!104687 (arr!50528 (Array (_ BitVec 32) (_ BitVec 64))) (size!51078 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104686)

(declare-datatypes ((ValueCell!18469 0))(
  ( (ValueCellFull!18469 (v!22342 V!60205)) (EmptyCell!18469) )
))
(declare-datatypes ((array!104688 0))(
  ( (array!104689 (arr!50529 (Array (_ BitVec 32) ValueCell!18469)) (size!51079 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104688)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6732 (array!104686 array!104688 (_ BitVec 32) (_ BitVec 32) V!60205 V!60205 (_ BitVec 32) Int) ListLongMap!22703)

(assert (=> b!1567251 (= lt!672884 (getCurrentListMapNoExtraKeys!6732 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1567252 () Bool)

(declare-fun res!1071156 () Bool)

(assert (=> b!1567252 (=> (not res!1071156) (not e!873625))))

(declare-datatypes ((List!36655 0))(
  ( (Nil!36652) (Cons!36651 (h!38098 (_ BitVec 64)) (t!51559 List!36655)) )
))
(declare-fun arrayNoDuplicates!0 (array!104686 (_ BitVec 32) List!36655) Bool)

(assert (=> b!1567252 (= res!1071156 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36652))))

(declare-fun b!1567253 () Bool)

(declare-fun res!1071160 () Bool)

(assert (=> b!1567253 (=> (not res!1071160) (not e!873623))))

(assert (=> b!1567253 (= res!1071160 (not (contains!10361 lt!672884 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567254 () Bool)

(declare-fun res!1071158 () Bool)

(assert (=> b!1567254 (=> (not res!1071158) (not e!873625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104686 (_ BitVec 32)) Bool)

(assert (=> b!1567254 (= res!1071158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1567255 () Bool)

(declare-fun e!873624 () Bool)

(declare-fun e!873620 () Bool)

(assert (=> b!1567255 (= e!873624 (and e!873620 mapRes!59898))))

(declare-fun condMapEmpty!59898 () Bool)

(declare-fun mapDefault!59898 () ValueCell!18469)

