; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133730 () Bool)

(assert start!133730)

(declare-fun b_free!32093 () Bool)

(declare-fun b_next!32093 () Bool)

(assert (=> start!133730 (= b_free!32093 (not b_next!32093))))

(declare-fun tp!113484 () Bool)

(declare-fun b_and!51663 () Bool)

(assert (=> start!133730 (= tp!113484 b_and!51663)))

(declare-fun mapNonEmpty!59595 () Bool)

(declare-fun mapRes!59595 () Bool)

(declare-fun tp!113483 () Bool)

(declare-fun e!871491 () Bool)

(assert (=> mapNonEmpty!59595 (= mapRes!59595 (and tp!113483 e!871491))))

(declare-datatypes ((V!59957 0))(
  ( (V!59958 (val!19490 Int)) )
))
(declare-datatypes ((ValueCell!18376 0))(
  ( (ValueCellFull!18376 (v!22242 V!59957)) (EmptyCell!18376) )
))
(declare-fun mapValue!59595 () ValueCell!18376)

(declare-fun mapKey!59595 () (_ BitVec 32))

(declare-fun mapRest!59595 () (Array (_ BitVec 32) ValueCell!18376))

(declare-datatypes ((array!104320 0))(
  ( (array!104321 (arr!50352 (Array (_ BitVec 32) ValueCell!18376)) (size!50902 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104320)

(assert (=> mapNonEmpty!59595 (= (arr!50352 _values!487) (store mapRest!59595 mapKey!59595 mapValue!59595))))

(declare-fun b!1563665 () Bool)

(declare-fun res!1069004 () Bool)

(declare-fun e!871487 () Bool)

(assert (=> b!1563665 (=> (not res!1069004) (not e!871487))))

(declare-datatypes ((array!104322 0))(
  ( (array!104323 (arr!50353 (Array (_ BitVec 32) (_ BitVec 64))) (size!50903 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104322)

(declare-datatypes ((List!36530 0))(
  ( (Nil!36527) (Cons!36526 (h!37972 (_ BitVec 64)) (t!51377 List!36530)) )
))
(declare-fun arrayNoDuplicates!0 (array!104322 (_ BitVec 32) List!36530) Bool)

(assert (=> b!1563665 (= res!1069004 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36527))))

(declare-fun b!1563666 () Bool)

(declare-fun res!1069003 () Bool)

(assert (=> b!1563666 (=> (not res!1069003) (not e!871487))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1563666 (= res!1069003 (and (= (size!50902 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50903 _keys!637) (size!50902 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563667 () Bool)

(declare-fun res!1069002 () Bool)

(assert (=> b!1563667 (=> (not res!1069002) (not e!871487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104322 (_ BitVec 32)) Bool)

(assert (=> b!1563667 (= res!1069002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563668 () Bool)

(declare-fun res!1069007 () Bool)

(assert (=> b!1563668 (=> (not res!1069007) (not e!871487))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563668 (= res!1069007 (not (validKeyInArray!0 (select (arr!50353 _keys!637) from!782))))))

(declare-fun b!1563669 () Bool)

(declare-fun res!1069006 () Bool)

(assert (=> b!1563669 (=> (not res!1069006) (not e!871487))))

(assert (=> b!1563669 (= res!1069006 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50903 _keys!637)) (bvslt from!782 (size!50903 _keys!637))))))

(declare-fun b!1563670 () Bool)

(declare-fun e!871489 () Bool)

(declare-fun tp_is_empty!38813 () Bool)

(assert (=> b!1563670 (= e!871489 tp_is_empty!38813)))

(declare-fun b!1563671 () Bool)

(assert (=> b!1563671 (= e!871491 tp_is_empty!38813)))

(declare-fun b!1563672 () Bool)

(declare-fun e!871488 () Bool)

(assert (=> b!1563672 (= e!871487 e!871488)))

(declare-fun res!1069008 () Bool)

(assert (=> b!1563672 (=> (not res!1069008) (not e!871488))))

(declare-datatypes ((tuple2!25146 0))(
  ( (tuple2!25147 (_1!12584 (_ BitVec 64)) (_2!12584 V!59957)) )
))
(declare-datatypes ((List!36531 0))(
  ( (Nil!36528) (Cons!36527 (h!37973 tuple2!25146) (t!51378 List!36531)) )
))
(declare-datatypes ((ListLongMap!22581 0))(
  ( (ListLongMap!22582 (toList!11306 List!36531)) )
))
(declare-fun lt!671934 () ListLongMap!22581)

(declare-fun contains!10296 (ListLongMap!22581 (_ BitVec 64)) Bool)

(assert (=> b!1563672 (= res!1069008 (not (contains!10296 lt!671934 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59957)

(declare-fun minValue!453 () V!59957)

(declare-fun getCurrentListMapNoExtraKeys!6689 (array!104322 array!104320 (_ BitVec 32) (_ BitVec 32) V!59957 V!59957 (_ BitVec 32) Int) ListLongMap!22581)

(assert (=> b!1563672 (= lt!671934 (getCurrentListMapNoExtraKeys!6689 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1563673 () Bool)

(declare-fun e!871492 () Bool)

(assert (=> b!1563673 (= e!871492 (and e!871489 mapRes!59595))))

(declare-fun condMapEmpty!59595 () Bool)

(declare-fun mapDefault!59595 () ValueCell!18376)

