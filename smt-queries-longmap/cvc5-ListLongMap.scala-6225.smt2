; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79622 () Bool)

(assert start!79622)

(declare-fun b_free!17671 () Bool)

(declare-fun b_next!17671 () Bool)

(assert (=> start!79622 (= b_free!17671 (not b_next!17671))))

(declare-fun tp!61469 () Bool)

(declare-fun b_and!28933 () Bool)

(assert (=> start!79622 (= tp!61469 b_and!28933)))

(declare-fun b!935751 () Bool)

(declare-fun e!525452 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!935751 (= e!525452 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!935752 () Bool)

(declare-fun res!630117 () Bool)

(declare-fun e!525454 () Bool)

(assert (=> b!935752 (=> res!630117 e!525454)))

(declare-datatypes ((List!19090 0))(
  ( (Nil!19087) (Cons!19086 (h!20232 (_ BitVec 64)) (t!27305 List!19090)) )
))
(declare-fun contains!5077 (List!19090 (_ BitVec 64)) Bool)

(assert (=> b!935752 (= res!630117 (contains!5077 Nil!19087 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!935753 () Bool)

(declare-fun e!525449 () Bool)

(declare-fun e!525450 () Bool)

(declare-fun mapRes!32040 () Bool)

(assert (=> b!935753 (= e!525449 (and e!525450 mapRes!32040))))

(declare-fun condMapEmpty!32040 () Bool)

(declare-datatypes ((V!31871 0))(
  ( (V!31872 (val!10140 Int)) )
))
(declare-datatypes ((ValueCell!9608 0))(
  ( (ValueCellFull!9608 (v!12665 V!31871)) (EmptyCell!9608) )
))
(declare-datatypes ((array!56302 0))(
  ( (array!56303 (arr!27091 (Array (_ BitVec 32) ValueCell!9608)) (size!27550 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56302)

(declare-fun mapDefault!32040 () ValueCell!9608)

