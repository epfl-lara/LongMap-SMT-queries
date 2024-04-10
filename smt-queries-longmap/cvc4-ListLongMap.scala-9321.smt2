; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111366 () Bool)

(assert start!111366)

(declare-fun b_free!30023 () Bool)

(declare-fun b_next!30023 () Bool)

(assert (=> start!111366 (= b_free!30023 (not b_next!30023))))

(declare-fun tp!105544 () Bool)

(declare-fun b_and!48243 () Bool)

(assert (=> start!111366 (= tp!105544 b_and!48243)))

(declare-fun b!1317796 () Bool)

(declare-fun res!874594 () Bool)

(declare-fun e!752010 () Bool)

(assert (=> b!1317796 (=> (not res!874594) (not e!752010))))

(declare-datatypes ((array!88638 0))(
  ( (array!88639 (arr!42793 (Array (_ BitVec 32) (_ BitVec 64))) (size!43343 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88638)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88638 (_ BitVec 32)) Bool)

(assert (=> b!1317796 (= res!874594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317797 () Bool)

(declare-fun res!874592 () Bool)

(assert (=> b!1317797 (=> (not res!874592) (not e!752010))))

(declare-datatypes ((List!30319 0))(
  ( (Nil!30316) (Cons!30315 (h!31524 (_ BitVec 64)) (t!43927 List!30319)) )
))
(declare-fun arrayNoDuplicates!0 (array!88638 (_ BitVec 32) List!30319) Bool)

(assert (=> b!1317797 (= res!874592 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30316))))

(declare-fun b!1317798 () Bool)

(declare-fun e!752011 () Bool)

(declare-fun e!752012 () Bool)

(declare-fun mapRes!55412 () Bool)

(assert (=> b!1317798 (= e!752011 (and e!752012 mapRes!55412))))

(declare-fun condMapEmpty!55412 () Bool)

(declare-datatypes ((V!52893 0))(
  ( (V!52894 (val!17996 Int)) )
))
(declare-datatypes ((ValueCell!17023 0))(
  ( (ValueCellFull!17023 (v!20626 V!52893)) (EmptyCell!17023) )
))
(declare-datatypes ((array!88640 0))(
  ( (array!88641 (arr!42794 (Array (_ BitVec 32) ValueCell!17023)) (size!43344 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88640)

(declare-fun mapDefault!55412 () ValueCell!17023)

