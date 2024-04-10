; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84296 () Bool)

(assert start!84296)

(declare-fun b!986137 () Bool)

(declare-fun e!555955 () Bool)

(assert (=> b!986137 (= e!555955 false)))

(declare-fun lt!437444 () Bool)

(declare-datatypes ((array!62165 0))(
  ( (array!62166 (arr!29940 (Array (_ BitVec 32) (_ BitVec 64))) (size!30419 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62165)

(declare-datatypes ((List!20729 0))(
  ( (Nil!20726) (Cons!20725 (h!21887 (_ BitVec 64)) (t!29628 List!20729)) )
))
(declare-fun arrayNoDuplicates!0 (array!62165 (_ BitVec 32) List!20729) Bool)

(assert (=> b!986137 (= lt!437444 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20726))))

(declare-fun b!986138 () Bool)

(declare-fun e!555954 () Bool)

(declare-fun e!555953 () Bool)

(declare-fun mapRes!36677 () Bool)

(assert (=> b!986138 (= e!555954 (and e!555953 mapRes!36677))))

(declare-fun condMapEmpty!36677 () Bool)

(declare-datatypes ((V!35781 0))(
  ( (V!35782 (val!11600 Int)) )
))
(declare-datatypes ((ValueCell!11068 0))(
  ( (ValueCellFull!11068 (v!14162 V!35781)) (EmptyCell!11068) )
))
(declare-datatypes ((array!62167 0))(
  ( (array!62168 (arr!29941 (Array (_ BitVec 32) ValueCell!11068)) (size!30420 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62167)

(declare-fun mapDefault!36677 () ValueCell!11068)

