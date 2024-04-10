; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36060 () Bool)

(assert start!36060)

(declare-fun b!362042 () Bool)

(declare-fun res!201418 () Bool)

(declare-fun e!221753 () Bool)

(assert (=> b!362042 (=> (not res!201418) (not e!221753))))

(declare-datatypes ((array!20395 0))(
  ( (array!20396 (arr!9682 (Array (_ BitVec 32) (_ BitVec 64))) (size!10034 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20395)

(declare-fun extraKeys!1198 () (_ BitVec 32))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-datatypes ((V!12203 0))(
  ( (V!12204 (val!4254 Int)) )
))
(declare-datatypes ((ValueCell!3866 0))(
  ( (ValueCellFull!3866 (v!6449 V!12203)) (EmptyCell!3866) )
))
(declare-datatypes ((array!20397 0))(
  ( (array!20398 (arr!9683 (Array (_ BitVec 32) ValueCell!3866)) (size!10035 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20397)

(assert (=> b!362042 (= res!201418 (and (= (size!10035 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!10034 _keys!1541) (size!10035 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!362043 () Bool)

(declare-fun res!201421 () Bool)

(assert (=> b!362043 (=> (not res!201421) (not e!221753))))

(declare-fun from!1924 () (_ BitVec 32))

(declare-fun k!1134 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!362043 (= res!201421 (arrayContainsKey!0 _keys!1541 k!1134 from!1924))))

(declare-fun b!362044 () Bool)

(declare-fun res!201422 () Bool)

(assert (=> b!362044 (=> (not res!201422) (not e!221753))))

(assert (=> b!362044 (= res!201422 (and (bvsge from!1924 #b00000000000000000000000000000000) (bvslt from!1924 (size!10034 _keys!1541))))))

(declare-fun res!201416 () Bool)

(assert (=> start!36060 (=> (not res!201416) (not e!221753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36060 (= res!201416 (validMask!0 mask!1943))))

(assert (=> start!36060 e!221753))

(assert (=> start!36060 true))

(declare-fun array_inv!7124 (array!20395) Bool)

(assert (=> start!36060 (array_inv!7124 _keys!1541)))

(declare-fun e!221754 () Bool)

(declare-fun array_inv!7125 (array!20397) Bool)

(assert (=> start!36060 (and (array_inv!7125 _values!1277) e!221754)))

(declare-fun b!362045 () Bool)

(declare-fun e!221752 () Bool)

(declare-fun mapRes!14163 () Bool)

(assert (=> b!362045 (= e!221754 (and e!221752 mapRes!14163))))

(declare-fun condMapEmpty!14163 () Bool)

(declare-fun mapDefault!14163 () ValueCell!3866)

