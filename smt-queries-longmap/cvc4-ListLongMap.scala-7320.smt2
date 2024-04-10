; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93562 () Bool)

(assert start!93562)

(declare-fun mapNonEmpty!39016 () Bool)

(declare-fun mapRes!39016 () Bool)

(declare-fun tp!74822 () Bool)

(declare-fun e!602621 () Bool)

(assert (=> mapNonEmpty!39016 (= mapRes!39016 (and tp!74822 e!602621))))

(declare-datatypes ((V!38349 0))(
  ( (V!38350 (val!12506 Int)) )
))
(declare-datatypes ((ValueCell!11752 0))(
  ( (ValueCellFull!11752 (v!15115 V!38349)) (EmptyCell!11752) )
))
(declare-fun mapRest!39016 () (Array (_ BitVec 32) ValueCell!11752))

(declare-fun mapValue!39016 () ValueCell!11752)

(declare-datatypes ((array!66847 0))(
  ( (array!66848 (arr!32138 (Array (_ BitVec 32) ValueCell!11752)) (size!32674 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66847)

(declare-fun mapKey!39016 () (_ BitVec 32))

(assert (=> mapNonEmpty!39016 (= (arr!32138 _values!955) (store mapRest!39016 mapKey!39016 mapValue!39016))))

(declare-fun res!707486 () Bool)

(declare-fun e!602623 () Bool)

(assert (=> start!93562 (=> (not res!707486) (not e!602623))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93562 (= res!707486 (validMask!0 mask!1515))))

(assert (=> start!93562 e!602623))

(assert (=> start!93562 true))

(declare-fun e!602622 () Bool)

(declare-fun array_inv!24918 (array!66847) Bool)

(assert (=> start!93562 (and (array_inv!24918 _values!955) e!602622)))

(declare-datatypes ((array!66849 0))(
  ( (array!66850 (arr!32139 (Array (_ BitVec 32) (_ BitVec 64))) (size!32675 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66849)

(declare-fun array_inv!24919 (array!66849) Bool)

(assert (=> start!93562 (array_inv!24919 _keys!1163)))

(declare-fun b!1058981 () Bool)

(declare-fun tp_is_empty!24911 () Bool)

(assert (=> b!1058981 (= e!602621 tp_is_empty!24911)))

(declare-fun mapIsEmpty!39016 () Bool)

(assert (=> mapIsEmpty!39016 mapRes!39016))

(declare-fun b!1058982 () Bool)

(declare-fun e!602620 () Bool)

(assert (=> b!1058982 (= e!602622 (and e!602620 mapRes!39016))))

(declare-fun condMapEmpty!39016 () Bool)

(declare-fun mapDefault!39016 () ValueCell!11752)

