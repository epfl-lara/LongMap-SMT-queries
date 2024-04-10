; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133754 () Bool)

(assert start!133754)

(declare-fun b_free!32117 () Bool)

(declare-fun b_next!32117 () Bool)

(assert (=> start!133754 (= b_free!32117 (not b_next!32117))))

(declare-fun tp!113556 () Bool)

(declare-fun b_and!51687 () Bool)

(assert (=> start!133754 (= tp!113556 b_and!51687)))

(declare-fun b!1564033 () Bool)

(declare-fun res!1069269 () Bool)

(declare-fun e!871707 () Bool)

(assert (=> b!1564033 (=> (not res!1069269) (not e!871707))))

(declare-datatypes ((array!104366 0))(
  ( (array!104367 (arr!50375 (Array (_ BitVec 32) (_ BitVec 64))) (size!50925 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104366)

(declare-datatypes ((List!36550 0))(
  ( (Nil!36547) (Cons!36546 (h!37992 (_ BitVec 64)) (t!51397 List!36550)) )
))
(declare-fun arrayNoDuplicates!0 (array!104366 (_ BitVec 32) List!36550) Bool)

(assert (=> b!1564033 (= res!1069269 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36547))))

(declare-fun b!1564034 () Bool)

(declare-fun res!1069263 () Bool)

(assert (=> b!1564034 (=> (not res!1069263) (not e!871707))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564034 (= res!1069263 (not (validKeyInArray!0 (select (arr!50375 _keys!637) from!782))))))

(declare-fun b!1564035 () Bool)

(declare-fun e!871703 () Bool)

(declare-fun tp_is_empty!38837 () Bool)

(assert (=> b!1564035 (= e!871703 tp_is_empty!38837)))

(declare-fun b!1564036 () Bool)

(declare-fun res!1069262 () Bool)

(assert (=> b!1564036 (=> (not res!1069262) (not e!871707))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59989 0))(
  ( (V!59990 (val!19502 Int)) )
))
(declare-datatypes ((ValueCell!18388 0))(
  ( (ValueCellFull!18388 (v!22254 V!59989)) (EmptyCell!18388) )
))
(declare-datatypes ((array!104368 0))(
  ( (array!104369 (arr!50376 (Array (_ BitVec 32) ValueCell!18388)) (size!50926 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104368)

(assert (=> b!1564036 (= res!1069262 (and (= (size!50926 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50925 _keys!637) (size!50926 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!59631 () Bool)

(declare-fun mapRes!59631 () Bool)

(assert (=> mapIsEmpty!59631 mapRes!59631))

(declare-fun b!1564037 () Bool)

(declare-fun res!1069265 () Bool)

(assert (=> b!1564037 (=> (not res!1069265) (not e!871707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104366 (_ BitVec 32)) Bool)

(assert (=> b!1564037 (= res!1069265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564038 () Bool)

(declare-fun res!1069268 () Bool)

(assert (=> b!1564038 (=> (not res!1069268) (not e!871707))))

(assert (=> b!1564038 (= res!1069268 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50925 _keys!637)) (bvslt from!782 (size!50925 _keys!637))))))

(declare-fun b!1564039 () Bool)

(declare-fun e!871706 () Bool)

(assert (=> b!1564039 (= e!871706 (and e!871703 mapRes!59631))))

(declare-fun condMapEmpty!59631 () Bool)

(declare-fun mapDefault!59631 () ValueCell!18388)

