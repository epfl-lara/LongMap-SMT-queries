; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84370 () Bool)

(assert start!84370)

(declare-fun b_free!19957 () Bool)

(declare-fun b_next!19957 () Bool)

(assert (=> start!84370 (= b_free!19957 (not b_next!19957))))

(declare-fun tp!69645 () Bool)

(declare-fun b_and!31991 () Bool)

(assert (=> start!84370 (= tp!69645 b_and!31991)))

(declare-fun mapIsEmpty!36788 () Bool)

(declare-fun mapRes!36788 () Bool)

(assert (=> mapIsEmpty!36788 mapRes!36788))

(declare-fun b!986865 () Bool)

(declare-fun res!660227 () Bool)

(declare-fun e!556508 () Bool)

(assert (=> b!986865 (=> (not res!660227) (not e!556508))))

(declare-datatypes ((array!62305 0))(
  ( (array!62306 (arr!30010 (Array (_ BitVec 32) (_ BitVec 64))) (size!30489 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62305)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62305 (_ BitVec 32)) Bool)

(assert (=> b!986865 (= res!660227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!660223 () Bool)

(assert (=> start!84370 (=> (not res!660223) (not e!556508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84370 (= res!660223 (validMask!0 mask!1948))))

(assert (=> start!84370 e!556508))

(assert (=> start!84370 true))

(declare-fun tp_is_empty!23173 () Bool)

(assert (=> start!84370 tp_is_empty!23173))

(declare-datatypes ((V!35881 0))(
  ( (V!35882 (val!11637 Int)) )
))
(declare-datatypes ((ValueCell!11105 0))(
  ( (ValueCellFull!11105 (v!14199 V!35881)) (EmptyCell!11105) )
))
(declare-datatypes ((array!62307 0))(
  ( (array!62308 (arr!30011 (Array (_ BitVec 32) ValueCell!11105)) (size!30490 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62307)

(declare-fun e!556510 () Bool)

(declare-fun array_inv!23189 (array!62307) Bool)

(assert (=> start!84370 (and (array_inv!23189 _values!1278) e!556510)))

(assert (=> start!84370 tp!69645))

(declare-fun array_inv!23190 (array!62305) Bool)

(assert (=> start!84370 (array_inv!23190 _keys!1544)))

(declare-fun b!986866 () Bool)

(declare-fun e!556509 () Bool)

(assert (=> b!986866 (= e!556509 tp_is_empty!23173)))

(declare-fun b!986867 () Bool)

(declare-fun e!556511 () Bool)

(assert (=> b!986867 (= e!556510 (and e!556511 mapRes!36788))))

(declare-fun condMapEmpty!36788 () Bool)

(declare-fun mapDefault!36788 () ValueCell!11105)

