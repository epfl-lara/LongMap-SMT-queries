; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35950 () Bool)

(assert start!35950)

(declare-fun b!361247 () Bool)

(declare-fun e!221193 () Bool)

(declare-datatypes ((List!5502 0))(
  ( (Nil!5499) (Cons!5498 (h!6354 (_ BitVec 64)) (t!10652 List!5502)) )
))
(declare-fun noDuplicate!180 (List!5502) Bool)

(assert (=> b!361247 (= e!221193 (not (noDuplicate!180 Nil!5499)))))

(declare-fun res!200955 () Bool)

(assert (=> start!35950 (=> (not res!200955) (not e!221193))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35950 (= res!200955 (validMask!0 mask!1943))))

(assert (=> start!35950 e!221193))

(assert (=> start!35950 true))

(declare-datatypes ((V!12131 0))(
  ( (V!12132 (val!4227 Int)) )
))
(declare-datatypes ((ValueCell!3839 0))(
  ( (ValueCellFull!3839 (v!6421 V!12131)) (EmptyCell!3839) )
))
(declare-datatypes ((array!20283 0))(
  ( (array!20284 (arr!9631 (Array (_ BitVec 32) ValueCell!3839)) (size!9983 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20283)

(declare-fun e!221194 () Bool)

(declare-fun array_inv!7082 (array!20283) Bool)

(assert (=> start!35950 (and (array_inv!7082 _values!1277) e!221194)))

(declare-datatypes ((array!20285 0))(
  ( (array!20286 (arr!9632 (Array (_ BitVec 32) (_ BitVec 64))) (size!9984 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20285)

(declare-fun array_inv!7083 (array!20285) Bool)

(assert (=> start!35950 (array_inv!7083 _keys!1541)))

(declare-fun b!361248 () Bool)

(declare-fun res!200952 () Bool)

(assert (=> b!361248 (=> (not res!200952) (not e!221193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20285 (_ BitVec 32)) Bool)

(assert (=> b!361248 (= res!200952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361249 () Bool)

(declare-fun res!200954 () Bool)

(assert (=> b!361249 (=> (not res!200954) (not e!221193))))

(assert (=> b!361249 (= res!200954 (and (bvsle #b00000000000000000000000000000000 (size!9984 _keys!1541)) (bvslt (size!9984 _keys!1541) #b01111111111111111111111111111111)))))

(declare-fun b!361250 () Bool)

(declare-fun e!221196 () Bool)

(declare-fun mapRes!14067 () Bool)

(assert (=> b!361250 (= e!221194 (and e!221196 mapRes!14067))))

(declare-fun condMapEmpty!14067 () Bool)

(declare-fun mapDefault!14067 () ValueCell!3839)

