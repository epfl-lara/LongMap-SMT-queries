; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84256 () Bool)

(assert start!84256)

(declare-fun b!985777 () Bool)

(declare-fun e!555654 () Bool)

(assert (=> b!985777 (= e!555654 false)))

(declare-fun lt!437384 () Bool)

(declare-datatypes ((array!62093 0))(
  ( (array!62094 (arr!29904 (Array (_ BitVec 32) (_ BitVec 64))) (size!30383 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62093)

(declare-datatypes ((List!20714 0))(
  ( (Nil!20711) (Cons!20710 (h!21872 (_ BitVec 64)) (t!29613 List!20714)) )
))
(declare-fun arrayNoDuplicates!0 (array!62093 (_ BitVec 32) List!20714) Bool)

(assert (=> b!985777 (= lt!437384 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20711))))

(declare-fun b!985778 () Bool)

(declare-fun e!555656 () Bool)

(declare-fun e!555657 () Bool)

(declare-fun mapRes!36617 () Bool)

(assert (=> b!985778 (= e!555656 (and e!555657 mapRes!36617))))

(declare-fun condMapEmpty!36617 () Bool)

(declare-datatypes ((V!35729 0))(
  ( (V!35730 (val!11580 Int)) )
))
(declare-datatypes ((ValueCell!11048 0))(
  ( (ValueCellFull!11048 (v!14142 V!35729)) (EmptyCell!11048) )
))
(declare-datatypes ((array!62095 0))(
  ( (array!62096 (arr!29905 (Array (_ BitVec 32) ValueCell!11048)) (size!30384 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62095)

(declare-fun mapDefault!36617 () ValueCell!11048)

