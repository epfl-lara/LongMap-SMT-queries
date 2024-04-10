; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111034 () Bool)

(assert start!111034)

(declare-fun b_free!29869 () Bool)

(declare-fun b_next!29869 () Bool)

(assert (=> start!111034 (= b_free!29869 (not b_next!29869))))

(declare-fun tp!104928 () Bool)

(declare-fun b_and!48077 () Bool)

(assert (=> start!111034 (= tp!104928 b_and!48077)))

(declare-fun mapIsEmpty!55027 () Bool)

(declare-fun mapRes!55027 () Bool)

(assert (=> mapIsEmpty!55027 mapRes!55027))

(declare-fun b!1314602 () Bool)

(declare-fun res!872735 () Bool)

(declare-fun e!749878 () Bool)

(assert (=> b!1314602 (=> (not res!872735) (not e!749878))))

(declare-datatypes ((array!88166 0))(
  ( (array!88167 (arr!42563 (Array (_ BitVec 32) (_ BitVec 64))) (size!43113 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88166)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88166 (_ BitVec 32)) Bool)

(assert (=> b!1314602 (= res!872735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314604 () Bool)

(declare-fun res!872738 () Bool)

(assert (=> b!1314604 (=> (not res!872738) (not e!749878))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314604 (= res!872738 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43113 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314605 () Bool)

(declare-fun e!749880 () Bool)

(declare-fun e!749882 () Bool)

(assert (=> b!1314605 (= e!749880 (and e!749882 mapRes!55027))))

(declare-fun condMapEmpty!55027 () Bool)

(declare-datatypes ((V!52569 0))(
  ( (V!52570 (val!17874 Int)) )
))
(declare-datatypes ((ValueCell!16901 0))(
  ( (ValueCellFull!16901 (v!20501 V!52569)) (EmptyCell!16901) )
))
(declare-datatypes ((array!88168 0))(
  ( (array!88169 (arr!42564 (Array (_ BitVec 32) ValueCell!16901)) (size!43114 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88168)

(declare-fun mapDefault!55027 () ValueCell!16901)

