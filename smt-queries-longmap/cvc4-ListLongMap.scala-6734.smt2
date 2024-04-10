; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84380 () Bool)

(assert start!84380)

(declare-fun b_free!19967 () Bool)

(declare-fun b_next!19967 () Bool)

(assert (=> start!84380 (= b_free!19967 (not b_next!19967))))

(declare-fun tp!69676 () Bool)

(declare-fun b_and!32001 () Bool)

(assert (=> start!84380 (= tp!69676 b_and!32001)))

(declare-fun mapIsEmpty!36803 () Bool)

(declare-fun mapRes!36803 () Bool)

(assert (=> mapIsEmpty!36803 mapRes!36803))

(declare-fun b!987015 () Bool)

(declare-fun e!556584 () Bool)

(declare-fun tp_is_empty!23183 () Bool)

(assert (=> b!987015 (= e!556584 tp_is_empty!23183)))

(declare-fun b!987016 () Bool)

(declare-fun e!556585 () Bool)

(assert (=> b!987016 (= e!556585 tp_is_empty!23183)))

(declare-fun res!660327 () Bool)

(declare-fun e!556583 () Bool)

(assert (=> start!84380 (=> (not res!660327) (not e!556583))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84380 (= res!660327 (validMask!0 mask!1948))))

(assert (=> start!84380 e!556583))

(assert (=> start!84380 true))

(assert (=> start!84380 tp_is_empty!23183))

(declare-datatypes ((V!35893 0))(
  ( (V!35894 (val!11642 Int)) )
))
(declare-datatypes ((ValueCell!11110 0))(
  ( (ValueCellFull!11110 (v!14204 V!35893)) (EmptyCell!11110) )
))
(declare-datatypes ((array!62323 0))(
  ( (array!62324 (arr!30019 (Array (_ BitVec 32) ValueCell!11110)) (size!30498 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62323)

(declare-fun e!556586 () Bool)

(declare-fun array_inv!23197 (array!62323) Bool)

(assert (=> start!84380 (and (array_inv!23197 _values!1278) e!556586)))

(assert (=> start!84380 tp!69676))

(declare-datatypes ((array!62325 0))(
  ( (array!62326 (arr!30020 (Array (_ BitVec 32) (_ BitVec 64))) (size!30499 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62325)

(declare-fun array_inv!23198 (array!62325) Bool)

(assert (=> start!84380 (array_inv!23198 _keys!1544)))

(declare-fun b!987017 () Bool)

(declare-fun res!660331 () Bool)

(assert (=> b!987017 (=> (not res!660331) (not e!556583))))

(declare-datatypes ((List!20760 0))(
  ( (Nil!20757) (Cons!20756 (h!21918 (_ BitVec 64)) (t!29659 List!20760)) )
))
(declare-fun arrayNoDuplicates!0 (array!62325 (_ BitVec 32) List!20760) Bool)

(assert (=> b!987017 (= res!660331 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20757))))

(declare-fun b!987018 () Bool)

(assert (=> b!987018 (= e!556586 (and e!556584 mapRes!36803))))

(declare-fun condMapEmpty!36803 () Bool)

(declare-fun mapDefault!36803 () ValueCell!11110)

