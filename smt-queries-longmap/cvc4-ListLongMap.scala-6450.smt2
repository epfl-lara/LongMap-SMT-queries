; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82544 () Bool)

(assert start!82544)

(declare-fun b_free!18677 () Bool)

(declare-fun b_next!18677 () Bool)

(assert (=> start!82544 (= b_free!18677 (not b_next!18677))))

(declare-fun tp!65151 () Bool)

(declare-fun b_and!30165 () Bool)

(assert (=> start!82544 (= tp!65151 b_and!30165)))

(declare-fun mapIsEmpty!34213 () Bool)

(declare-fun mapRes!34213 () Bool)

(assert (=> mapIsEmpty!34213 mapRes!34213))

(declare-fun b!961925 () Bool)

(declare-fun res!643743 () Bool)

(declare-fun e!542464 () Bool)

(assert (=> b!961925 (=> (not res!643743) (not e!542464))))

(declare-datatypes ((array!59055 0))(
  ( (array!59056 (arr!28396 (Array (_ BitVec 32) (_ BitVec 64))) (size!28875 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59055)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59055 (_ BitVec 32)) Bool)

(assert (=> b!961925 (= res!643743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961926 () Bool)

(declare-fun e!542465 () Bool)

(declare-fun tp_is_empty!21479 () Bool)

(assert (=> b!961926 (= e!542465 tp_is_empty!21479)))

(declare-fun b!961927 () Bool)

(declare-fun res!643746 () Bool)

(assert (=> b!961927 (=> (not res!643746) (not e!542464))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961927 (= res!643746 (validKeyInArray!0 (select (arr!28396 _keys!1686) i!803)))))

(declare-fun res!643744 () Bool)

(assert (=> start!82544 (=> (not res!643744) (not e!542464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82544 (= res!643744 (validMask!0 mask!2110))))

(assert (=> start!82544 e!542464))

(assert (=> start!82544 true))

(declare-datatypes ((V!33621 0))(
  ( (V!33622 (val!10790 Int)) )
))
(declare-datatypes ((ValueCell!10258 0))(
  ( (ValueCellFull!10258 (v!13348 V!33621)) (EmptyCell!10258) )
))
(declare-datatypes ((array!59057 0))(
  ( (array!59058 (arr!28397 (Array (_ BitVec 32) ValueCell!10258)) (size!28876 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59057)

(declare-fun e!542462 () Bool)

(declare-fun array_inv!22005 (array!59057) Bool)

(assert (=> start!82544 (and (array_inv!22005 _values!1400) e!542462)))

(declare-fun array_inv!22006 (array!59055) Bool)

(assert (=> start!82544 (array_inv!22006 _keys!1686)))

(assert (=> start!82544 tp!65151))

(assert (=> start!82544 tp_is_empty!21479))

(declare-fun b!961928 () Bool)

(declare-fun e!542461 () Bool)

(assert (=> b!961928 (= e!542461 tp_is_empty!21479)))

(declare-fun b!961929 () Bool)

(declare-fun res!643747 () Bool)

(assert (=> b!961929 (=> (not res!643747) (not e!542464))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!961929 (= res!643747 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28875 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28875 _keys!1686))))))

(declare-fun b!961930 () Bool)

(assert (=> b!961930 (= e!542462 (and e!542465 mapRes!34213))))

(declare-fun condMapEmpty!34213 () Bool)

(declare-fun mapDefault!34213 () ValueCell!10258)

