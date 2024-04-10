; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93660 () Bool)

(assert start!93660)

(declare-fun b!1059609 () Bool)

(declare-fun e!603122 () Bool)

(assert (=> b!1059609 (= e!603122 false)))

(declare-fun lt!467152 () Bool)

(declare-datatypes ((array!66957 0))(
  ( (array!66958 (arr!32188 (Array (_ BitVec 32) (_ BitVec 64))) (size!32724 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66957)

(declare-datatypes ((List!22436 0))(
  ( (Nil!22433) (Cons!22432 (h!23641 (_ BitVec 64)) (t!31743 List!22436)) )
))
(declare-fun arrayNoDuplicates!0 (array!66957 (_ BitVec 32) List!22436) Bool)

(assert (=> b!1059609 (= lt!467152 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22433))))

(declare-fun b!1059610 () Bool)

(declare-fun res!707809 () Bool)

(assert (=> b!1059610 (=> (not res!707809) (not e!603122))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66957 (_ BitVec 32)) Bool)

(assert (=> b!1059610 (= res!707809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39112 () Bool)

(declare-fun mapRes!39112 () Bool)

(assert (=> mapIsEmpty!39112 mapRes!39112))

(declare-fun b!1059611 () Bool)

(declare-fun e!603120 () Bool)

(declare-fun e!603121 () Bool)

(assert (=> b!1059611 (= e!603120 (and e!603121 mapRes!39112))))

(declare-fun condMapEmpty!39112 () Bool)

(declare-datatypes ((V!38421 0))(
  ( (V!38422 (val!12533 Int)) )
))
(declare-datatypes ((ValueCell!11779 0))(
  ( (ValueCellFull!11779 (v!15143 V!38421)) (EmptyCell!11779) )
))
(declare-datatypes ((array!66959 0))(
  ( (array!66960 (arr!32189 (Array (_ BitVec 32) ValueCell!11779)) (size!32725 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66959)

(declare-fun mapDefault!39112 () ValueCell!11779)

