; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93598 () Bool)

(assert start!93598)

(declare-fun mapIsEmpty!39046 () Bool)

(declare-fun mapRes!39046 () Bool)

(assert (=> mapIsEmpty!39046 mapRes!39046))

(declare-fun b!1059155 () Bool)

(declare-fun res!707562 () Bool)

(declare-fun e!602762 () Bool)

(assert (=> b!1059155 (=> (not res!707562) (not e!602762))))

(declare-datatypes ((array!66877 0))(
  ( (array!66878 (arr!32150 (Array (_ BitVec 32) (_ BitVec 64))) (size!32686 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66877)

(assert (=> b!1059155 (= res!707562 (and (bvsle #b00000000000000000000000000000000 (size!32686 _keys!1163)) (bvslt (size!32686 _keys!1163) #b01111111111111111111111111111111)))))

(declare-fun b!1059156 () Bool)

(declare-fun res!707561 () Bool)

(assert (=> b!1059156 (=> (not res!707561) (not e!602762))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66877 (_ BitVec 32)) Bool)

(assert (=> b!1059156 (= res!707561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059157 () Bool)

(declare-fun e!602763 () Bool)

(declare-fun e!602764 () Bool)

(assert (=> b!1059157 (= e!602763 (and e!602764 mapRes!39046))))

(declare-fun condMapEmpty!39046 () Bool)

(declare-datatypes ((V!38369 0))(
  ( (V!38370 (val!12513 Int)) )
))
(declare-datatypes ((ValueCell!11759 0))(
  ( (ValueCellFull!11759 (v!15122 V!38369)) (EmptyCell!11759) )
))
(declare-datatypes ((array!66879 0))(
  ( (array!66880 (arr!32151 (Array (_ BitVec 32) ValueCell!11759)) (size!32687 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66879)

(declare-fun mapDefault!39046 () ValueCell!11759)

