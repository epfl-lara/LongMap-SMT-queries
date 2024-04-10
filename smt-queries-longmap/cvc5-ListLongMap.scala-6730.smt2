; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84352 () Bool)

(assert start!84352)

(declare-fun b!986668 () Bool)

(declare-fun res!660107 () Bool)

(declare-fun e!556374 () Bool)

(assert (=> b!986668 (=> (not res!660107) (not e!556374))))

(declare-datatypes ((array!62271 0))(
  ( (array!62272 (arr!29993 (Array (_ BitVec 32) (_ BitVec 64))) (size!30472 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62271)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62271 (_ BitVec 32)) Bool)

(assert (=> b!986668 (= res!660107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36761 () Bool)

(declare-fun mapRes!36761 () Bool)

(assert (=> mapIsEmpty!36761 mapRes!36761))

(declare-fun b!986669 () Bool)

(assert (=> b!986669 (= e!556374 false)))

(declare-fun lt!437528 () Bool)

(declare-datatypes ((List!20748 0))(
  ( (Nil!20745) (Cons!20744 (h!21906 (_ BitVec 64)) (t!29647 List!20748)) )
))
(declare-fun arrayNoDuplicates!0 (array!62271 (_ BitVec 32) List!20748) Bool)

(assert (=> b!986669 (= lt!437528 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20745))))

(declare-fun b!986670 () Bool)

(declare-fun e!556373 () Bool)

(declare-fun e!556376 () Bool)

(assert (=> b!986670 (= e!556373 (and e!556376 mapRes!36761))))

(declare-fun condMapEmpty!36761 () Bool)

(declare-datatypes ((V!35857 0))(
  ( (V!35858 (val!11628 Int)) )
))
(declare-datatypes ((ValueCell!11096 0))(
  ( (ValueCellFull!11096 (v!14190 V!35857)) (EmptyCell!11096) )
))
(declare-datatypes ((array!62273 0))(
  ( (array!62274 (arr!29994 (Array (_ BitVec 32) ValueCell!11096)) (size!30473 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62273)

(declare-fun mapDefault!36761 () ValueCell!11096)

