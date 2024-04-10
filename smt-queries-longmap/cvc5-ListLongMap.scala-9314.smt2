; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111320 () Bool)

(assert start!111320)

(declare-fun b!1317321 () Bool)

(declare-fun e!751668 () Bool)

(declare-fun tp_is_empty!35797 () Bool)

(assert (=> b!1317321 (= e!751668 tp_is_empty!35797)))

(declare-fun res!874325 () Bool)

(declare-fun e!751667 () Bool)

(assert (=> start!111320 (=> (not res!874325) (not e!751667))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111320 (= res!874325 (validMask!0 mask!2019))))

(assert (=> start!111320 e!751667))

(assert (=> start!111320 true))

(declare-datatypes ((V!52833 0))(
  ( (V!52834 (val!17973 Int)) )
))
(declare-datatypes ((ValueCell!17000 0))(
  ( (ValueCellFull!17000 (v!20603 V!52833)) (EmptyCell!17000) )
))
(declare-datatypes ((array!88552 0))(
  ( (array!88553 (arr!42750 (Array (_ BitVec 32) ValueCell!17000)) (size!43300 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88552)

(declare-fun e!751666 () Bool)

(declare-fun array_inv!32287 (array!88552) Bool)

(assert (=> start!111320 (and (array_inv!32287 _values!1337) e!751666)))

(declare-datatypes ((array!88554 0))(
  ( (array!88555 (arr!42751 (Array (_ BitVec 32) (_ BitVec 64))) (size!43301 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88554)

(declare-fun array_inv!32288 (array!88554) Bool)

(assert (=> start!111320 (array_inv!32288 _keys!1609)))

(declare-fun b!1317322 () Bool)

(declare-fun res!874324 () Bool)

(assert (=> b!1317322 (=> (not res!874324) (not e!751667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88554 (_ BitVec 32)) Bool)

(assert (=> b!1317322 (= res!874324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317323 () Bool)

(declare-fun e!751669 () Bool)

(assert (=> b!1317323 (= e!751669 tp_is_empty!35797)))

(declare-fun b!1317324 () Bool)

(assert (=> b!1317324 (= e!751667 false)))

(declare-fun lt!586350 () Bool)

(declare-datatypes ((List!30302 0))(
  ( (Nil!30299) (Cons!30298 (h!31507 (_ BitVec 64)) (t!43910 List!30302)) )
))
(declare-fun arrayNoDuplicates!0 (array!88554 (_ BitVec 32) List!30302) Bool)

(assert (=> b!1317324 (= lt!586350 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30299))))

(declare-fun b!1317325 () Bool)

(declare-fun mapRes!55343 () Bool)

(assert (=> b!1317325 (= e!751666 (and e!751668 mapRes!55343))))

(declare-fun condMapEmpty!55343 () Bool)

(declare-fun mapDefault!55343 () ValueCell!17000)

