; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100476 () Bool)

(assert start!100476)

(declare-fun b_free!25799 () Bool)

(declare-fun b_next!25799 () Bool)

(assert (=> start!100476 (= b_free!25799 (not b_next!25799))))

(declare-fun tp!90386 () Bool)

(declare-fun b_and!42485 () Bool)

(assert (=> start!100476 (= tp!90386 b_and!42485)))

(declare-fun b!1199980 () Bool)

(declare-fun res!798761 () Bool)

(declare-fun e!681505 () Bool)

(assert (=> b!1199980 (=> (not res!798761) (not e!681505))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199980 (= res!798761 (validMask!0 mask!1564))))

(declare-fun b!1199981 () Bool)

(declare-fun e!681507 () Bool)

(declare-fun e!681503 () Bool)

(declare-fun mapRes!47597 () Bool)

(assert (=> b!1199981 (= e!681507 (and e!681503 mapRes!47597))))

(declare-fun condMapEmpty!47597 () Bool)

(declare-datatypes ((V!45797 0))(
  ( (V!45798 (val!15308 Int)) )
))
(declare-datatypes ((ValueCell!14542 0))(
  ( (ValueCellFull!14542 (v!17946 V!45797)) (EmptyCell!14542) )
))
(declare-datatypes ((array!77781 0))(
  ( (array!77782 (arr!37535 (Array (_ BitVec 32) ValueCell!14542)) (size!38071 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77781)

(declare-fun mapDefault!47597 () ValueCell!14542)

