; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99884 () Bool)

(assert start!99884)

(declare-fun b_free!25463 () Bool)

(declare-fun b_next!25463 () Bool)

(assert (=> start!99884 (= b_free!25463 (not b_next!25463))))

(declare-fun tp!89102 () Bool)

(declare-fun b_and!41793 () Bool)

(assert (=> start!99884 (= tp!89102 b_and!41793)))

(declare-fun b!1188554 () Bool)

(declare-fun res!790274 () Bool)

(declare-fun e!675801 () Bool)

(assert (=> b!1188554 (=> (not res!790274) (not e!675801))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76781 0))(
  ( (array!76782 (arr!37040 (Array (_ BitVec 32) (_ BitVec 64))) (size!37576 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76781)

(assert (=> b!1188554 (= res!790274 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37576 _keys!1208))))))

(declare-fun b!1188555 () Bool)

(declare-fun res!790273 () Bool)

(assert (=> b!1188555 (=> (not res!790273) (not e!675801))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76781 (_ BitVec 32)) Bool)

(assert (=> b!1188555 (= res!790273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1188556 () Bool)

(declare-fun e!675802 () Bool)

(declare-fun e!675797 () Bool)

(declare-fun mapRes!46817 () Bool)

(assert (=> b!1188556 (= e!675802 (and e!675797 mapRes!46817))))

(declare-fun condMapEmpty!46817 () Bool)

(declare-datatypes ((V!45117 0))(
  ( (V!45118 (val!15053 Int)) )
))
(declare-datatypes ((ValueCell!14287 0))(
  ( (ValueCellFull!14287 (v!17691 V!45117)) (EmptyCell!14287) )
))
(declare-datatypes ((array!76783 0))(
  ( (array!76784 (arr!37041 (Array (_ BitVec 32) ValueCell!14287)) (size!37577 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76783)

(declare-fun mapDefault!46817 () ValueCell!14287)

