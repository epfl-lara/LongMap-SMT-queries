; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4498 () Bool)

(assert start!4498)

(declare-fun b_free!1259 () Bool)

(declare-fun b_next!1259 () Bool)

(assert (=> start!4498 (= b_free!1259 (not b_next!1259))))

(declare-fun tp!5215 () Bool)

(declare-fun b_and!2081 () Bool)

(assert (=> start!4498 (= tp!5215 b_and!2081)))

(declare-fun b!35101 () Bool)

(declare-fun res!21354 () Bool)

(declare-fun e!22178 () Bool)

(assert (=> b!35101 (=> (not res!21354) (not e!22178))))

(declare-datatypes ((array!2439 0))(
  ( (array!2440 (arr!1167 (Array (_ BitVec 32) (_ BitVec 64))) (size!1268 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2439)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2439 (_ BitVec 32)) Bool)

(assert (=> b!35101 (= res!21354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1966 () Bool)

(declare-fun mapRes!1966 () Bool)

(assert (=> mapIsEmpty!1966 mapRes!1966))

(declare-fun b!35102 () Bool)

(declare-fun res!21352 () Bool)

(assert (=> b!35102 (=> (not res!21352) (not e!22178))))

(declare-datatypes ((List!939 0))(
  ( (Nil!936) (Cons!935 (h!1502 (_ BitVec 64)) (t!3644 List!939)) )
))
(declare-fun arrayNoDuplicates!0 (array!2439 (_ BitVec 32) List!939) Bool)

(assert (=> b!35102 (= res!21352 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!936))))

(declare-fun b!35103 () Bool)

(declare-datatypes ((SeekEntryResult!160 0))(
  ( (MissingZero!160 (index!2762 (_ BitVec 32))) (Found!160 (index!2763 (_ BitVec 32))) (Intermediate!160 (undefined!972 Bool) (index!2764 (_ BitVec 32)) (x!6986 (_ BitVec 32))) (Undefined!160) (MissingVacant!160 (index!2765 (_ BitVec 32))) )
))
(declare-fun lt!12846 () SeekEntryResult!160)

(assert (=> b!35103 (= e!22178 (and (is-Found!160 lt!12846) (or (bvslt (index!2763 lt!12846) #b00000000000000000000000000000000) (bvsge (index!2763 lt!12846) (size!1268 _keys!1833)))))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2439 (_ BitVec 32)) SeekEntryResult!160)

(assert (=> b!35103 (= lt!12846 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun b!35104 () Bool)

(declare-fun e!22176 () Bool)

(declare-fun e!22177 () Bool)

(assert (=> b!35104 (= e!22176 (and e!22177 mapRes!1966))))

(declare-fun condMapEmpty!1966 () Bool)

(declare-datatypes ((V!1975 0))(
  ( (V!1976 (val!833 Int)) )
))
(declare-datatypes ((ValueCell!607 0))(
  ( (ValueCellFull!607 (v!1928 V!1975)) (EmptyCell!607) )
))
(declare-datatypes ((array!2441 0))(
  ( (array!2442 (arr!1168 (Array (_ BitVec 32) ValueCell!607)) (size!1269 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2441)

(declare-fun mapDefault!1966 () ValueCell!607)

