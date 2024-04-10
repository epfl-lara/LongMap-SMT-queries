; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131852 () Bool)

(assert start!131852)

(declare-fun mapNonEmpty!58465 () Bool)

(declare-fun mapRes!58465 () Bool)

(declare-fun tp!110992 () Bool)

(declare-fun e!859119 () Bool)

(assert (=> mapNonEmpty!58465 (= mapRes!58465 (and tp!110992 e!859119))))

(declare-fun mapKey!58465 () (_ BitVec 32))

(declare-datatypes ((V!58897 0))(
  ( (V!58898 (val!18998 Int)) )
))
(declare-datatypes ((ValueCell!18010 0))(
  ( (ValueCellFull!18010 (v!21799 V!58897)) (EmptyCell!18010) )
))
(declare-fun mapValue!58465 () ValueCell!18010)

(declare-fun mapRest!58465 () (Array (_ BitVec 32) ValueCell!18010))

(declare-datatypes ((array!102904 0))(
  ( (array!102905 (arr!49654 (Array (_ BitVec 32) ValueCell!18010)) (size!50204 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102904)

(assert (=> mapNonEmpty!58465 (= (arr!49654 _values!470) (store mapRest!58465 mapKey!58465 mapValue!58465))))

(declare-fun b!1543623 () Bool)

(declare-fun e!859117 () Bool)

(declare-fun tp_is_empty!37841 () Bool)

(assert (=> b!1543623 (= e!859117 tp_is_empty!37841)))

(declare-fun mapIsEmpty!58465 () Bool)

(assert (=> mapIsEmpty!58465 mapRes!58465))

(declare-fun b!1543624 () Bool)

(declare-fun e!859115 () Bool)

(assert (=> b!1543624 (= e!859115 false)))

(declare-fun lt!666014 () Bool)

(declare-datatypes ((array!102906 0))(
  ( (array!102907 (arr!49655 (Array (_ BitVec 32) (_ BitVec 64))) (size!50205 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102906)

(declare-datatypes ((List!35927 0))(
  ( (Nil!35924) (Cons!35923 (h!37368 (_ BitVec 64)) (t!50621 List!35927)) )
))
(declare-fun arrayNoDuplicates!0 (array!102906 (_ BitVec 32) List!35927) Bool)

(assert (=> b!1543624 (= lt!666014 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35924))))

(declare-fun b!1543625 () Bool)

(declare-fun res!1059087 () Bool)

(assert (=> b!1543625 (=> (not res!1059087) (not e!859115))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1543625 (= res!1059087 (and (= (size!50204 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50205 _keys!618) (size!50204 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543626 () Bool)

(declare-fun res!1059085 () Bool)

(assert (=> b!1543626 (=> (not res!1059085) (not e!859115))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102906 (_ BitVec 32)) Bool)

(assert (=> b!1543626 (= res!1059085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543627 () Bool)

(assert (=> b!1543627 (= e!859119 tp_is_empty!37841)))

(declare-fun res!1059086 () Bool)

(assert (=> start!131852 (=> (not res!1059086) (not e!859115))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131852 (= res!1059086 (validMask!0 mask!926))))

(assert (=> start!131852 e!859115))

(assert (=> start!131852 true))

(declare-fun e!859118 () Bool)

(declare-fun array_inv!38629 (array!102904) Bool)

(assert (=> start!131852 (and (array_inv!38629 _values!470) e!859118)))

(declare-fun array_inv!38630 (array!102906) Bool)

(assert (=> start!131852 (array_inv!38630 _keys!618)))

(declare-fun b!1543628 () Bool)

(assert (=> b!1543628 (= e!859118 (and e!859117 mapRes!58465))))

(declare-fun condMapEmpty!58465 () Bool)

(declare-fun mapDefault!58465 () ValueCell!18010)

