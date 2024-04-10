; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112326 () Bool)

(assert start!112326)

(declare-fun b_free!30721 () Bool)

(declare-fun b_next!30721 () Bool)

(assert (=> start!112326 (= b_free!30721 (not b_next!30721))))

(declare-fun tp!107800 () Bool)

(declare-fun b_and!49497 () Bool)

(assert (=> start!112326 (= tp!107800 b_and!49497)))

(declare-fun b!1331261 () Bool)

(declare-fun e!758607 () Bool)

(declare-fun tp_is_empty!36631 () Bool)

(assert (=> b!1331261 (= e!758607 tp_is_empty!36631)))

(declare-fun res!883391 () Bool)

(declare-fun e!758609 () Bool)

(assert (=> start!112326 (=> (not res!883391) (not e!758609))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112326 (= res!883391 (validMask!0 mask!1998))))

(assert (=> start!112326 e!758609))

(declare-datatypes ((V!53945 0))(
  ( (V!53946 (val!18390 Int)) )
))
(declare-datatypes ((ValueCell!17417 0))(
  ( (ValueCellFull!17417 (v!21027 V!53945)) (EmptyCell!17417) )
))
(declare-datatypes ((array!90142 0))(
  ( (array!90143 (arr!43537 (Array (_ BitVec 32) ValueCell!17417)) (size!44087 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90142)

(declare-fun e!758611 () Bool)

(declare-fun array_inv!32837 (array!90142) Bool)

(assert (=> start!112326 (and (array_inv!32837 _values!1320) e!758611)))

(assert (=> start!112326 true))

(declare-datatypes ((array!90144 0))(
  ( (array!90145 (arr!43538 (Array (_ BitVec 32) (_ BitVec 64))) (size!44088 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90144)

(declare-fun array_inv!32838 (array!90144) Bool)

(assert (=> start!112326 (array_inv!32838 _keys!1590)))

(assert (=> start!112326 tp!107800))

(assert (=> start!112326 tp_is_empty!36631))

(declare-fun b!1331262 () Bool)

(declare-fun res!883390 () Bool)

(assert (=> b!1331262 (=> (not res!883390) (not e!758609))))

(declare-datatypes ((List!30835 0))(
  ( (Nil!30832) (Cons!30831 (h!32040 (_ BitVec 64)) (t!44969 List!30835)) )
))
(declare-fun arrayNoDuplicates!0 (array!90144 (_ BitVec 32) List!30835) Bool)

(assert (=> b!1331262 (= res!883390 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30832))))

(declare-fun b!1331263 () Bool)

(declare-fun res!883394 () Bool)

(assert (=> b!1331263 (=> (not res!883394) (not e!758609))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1331263 (= res!883394 (not (= (select (arr!43538 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1331264 () Bool)

(declare-fun res!883392 () Bool)

(assert (=> b!1331264 (=> (not res!883392) (not e!758609))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1331264 (= res!883392 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1331265 () Bool)

(declare-fun e!758610 () Bool)

(declare-fun mapRes!56620 () Bool)

(assert (=> b!1331265 (= e!758611 (and e!758610 mapRes!56620))))

(declare-fun condMapEmpty!56620 () Bool)

(declare-fun mapDefault!56620 () ValueCell!17417)

