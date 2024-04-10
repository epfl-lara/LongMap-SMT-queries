; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!536 () Bool)

(assert start!536)

(declare-fun b!3160 () Bool)

(declare-fun e!1415 () Bool)

(assert (=> b!3160 (= e!1415 false)))

(declare-fun lt!429 () Bool)

(declare-datatypes ((array!133 0))(
  ( (array!134 (arr!60 (Array (_ BitVec 32) (_ BitVec 64))) (size!122 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!133)

(declare-datatypes ((List!46 0))(
  ( (Nil!43) (Cons!42 (h!608 (_ BitVec 64)) (t!2173 List!46)) )
))
(declare-fun arrayNoDuplicates!0 (array!133 (_ BitVec 32) List!46) Bool)

(assert (=> b!3160 (= lt!429 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!43))))

(declare-fun b!3161 () Bool)

(declare-fun e!1416 () Bool)

(declare-fun tp_is_empty!97 () Bool)

(assert (=> b!3161 (= e!1416 tp_is_empty!97)))

(declare-fun b!3162 () Bool)

(declare-fun res!5039 () Bool)

(assert (=> b!3162 (=> (not res!5039) (not e!1415))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!133 (_ BitVec 32)) Bool)

(assert (=> b!3162 (= res!5039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun res!5040 () Bool)

(assert (=> start!536 (=> (not res!5040) (not e!1415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!536 (= res!5040 (validMask!0 mask!2250))))

(assert (=> start!536 e!1415))

(assert (=> start!536 true))

(declare-datatypes ((V!307 0))(
  ( (V!308 (val!54 Int)) )
))
(declare-datatypes ((ValueCell!32 0))(
  ( (ValueCellFull!32 (v!1141 V!307)) (EmptyCell!32) )
))
(declare-datatypes ((array!135 0))(
  ( (array!136 (arr!61 (Array (_ BitVec 32) ValueCell!32)) (size!123 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!135)

(declare-fun e!1418 () Bool)

(declare-fun array_inv!39 (array!135) Bool)

(assert (=> start!536 (and (array_inv!39 _values!1492) e!1418)))

(declare-fun array_inv!40 (array!133) Bool)

(assert (=> start!536 (array_inv!40 _keys!1806)))

(declare-fun b!3159 () Bool)

(declare-fun e!1414 () Bool)

(assert (=> b!3159 (= e!1414 tp_is_empty!97)))

(declare-fun b!3163 () Bool)

(declare-fun res!5041 () Bool)

(assert (=> b!3163 (=> (not res!5041) (not e!1415))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!3163 (= res!5041 (and (= (size!123 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!122 _keys!1806) (size!123 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!3164 () Bool)

(declare-fun mapRes!101 () Bool)

(assert (=> b!3164 (= e!1418 (and e!1416 mapRes!101))))

(declare-fun condMapEmpty!101 () Bool)

(declare-fun mapDefault!101 () ValueCell!32)

