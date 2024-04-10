; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35776 () Bool)

(assert start!35776)

(declare-fun res!199746 () Bool)

(declare-fun e!220093 () Bool)

(assert (=> start!35776 (=> (not res!199746) (not e!220093))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35776 (= res!199746 (validMask!0 mask!1842))))

(assert (=> start!35776 e!220093))

(assert (=> start!35776 true))

(declare-datatypes ((V!11949 0))(
  ( (V!11950 (val!4159 Int)) )
))
(declare-datatypes ((ValueCell!3771 0))(
  ( (ValueCellFull!3771 (v!6353 V!11949)) (EmptyCell!3771) )
))
(declare-datatypes ((array!20017 0))(
  ( (array!20018 (arr!9502 (Array (_ BitVec 32) ValueCell!3771)) (size!9854 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20017)

(declare-fun e!220095 () Bool)

(declare-fun array_inv!6988 (array!20017) Bool)

(assert (=> start!35776 (and (array_inv!6988 _values!1208) e!220095)))

(declare-datatypes ((array!20019 0))(
  ( (array!20020 (arr!9503 (Array (_ BitVec 32) (_ BitVec 64))) (size!9855 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20019)

(declare-fun array_inv!6989 (array!20019) Bool)

(assert (=> start!35776 (array_inv!6989 _keys!1456)))

(declare-fun b!359372 () Bool)

(declare-fun res!199747 () Bool)

(assert (=> b!359372 (=> (not res!199747) (not e!220093))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359372 (= res!199747 (and (= (size!9854 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9855 _keys!1456) (size!9854 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359373 () Bool)

(declare-fun res!199745 () Bool)

(assert (=> b!359373 (=> (not res!199745) (not e!220093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20019 (_ BitVec 32)) Bool)

(assert (=> b!359373 (= res!199745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13851 () Bool)

(declare-fun mapRes!13851 () Bool)

(declare-fun tp!27918 () Bool)

(declare-fun e!220096 () Bool)

(assert (=> mapNonEmpty!13851 (= mapRes!13851 (and tp!27918 e!220096))))

(declare-fun mapKey!13851 () (_ BitVec 32))

(declare-fun mapRest!13851 () (Array (_ BitVec 32) ValueCell!3771))

(declare-fun mapValue!13851 () ValueCell!3771)

(assert (=> mapNonEmpty!13851 (= (arr!9502 _values!1208) (store mapRest!13851 mapKey!13851 mapValue!13851))))

(declare-fun b!359374 () Bool)

(assert (=> b!359374 (= e!220093 false)))

(declare-fun lt!166331 () Bool)

(declare-datatypes ((List!5466 0))(
  ( (Nil!5463) (Cons!5462 (h!6318 (_ BitVec 64)) (t!10616 List!5466)) )
))
(declare-fun arrayNoDuplicates!0 (array!20019 (_ BitVec 32) List!5466) Bool)

(assert (=> b!359374 (= lt!166331 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5463))))

(declare-fun mapIsEmpty!13851 () Bool)

(assert (=> mapIsEmpty!13851 mapRes!13851))

(declare-fun b!359375 () Bool)

(declare-fun e!220094 () Bool)

(assert (=> b!359375 (= e!220095 (and e!220094 mapRes!13851))))

(declare-fun condMapEmpty!13851 () Bool)

(declare-fun mapDefault!13851 () ValueCell!3771)

(assert (=> b!359375 (= condMapEmpty!13851 (= (arr!9502 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3771)) mapDefault!13851)))))

(declare-fun b!359376 () Bool)

(declare-fun tp_is_empty!8229 () Bool)

(assert (=> b!359376 (= e!220094 tp_is_empty!8229)))

(declare-fun b!359377 () Bool)

(assert (=> b!359377 (= e!220096 tp_is_empty!8229)))

(assert (= (and start!35776 res!199746) b!359372))

(assert (= (and b!359372 res!199747) b!359373))

(assert (= (and b!359373 res!199745) b!359374))

(assert (= (and b!359375 condMapEmpty!13851) mapIsEmpty!13851))

(assert (= (and b!359375 (not condMapEmpty!13851)) mapNonEmpty!13851))

(get-info :version)

(assert (= (and mapNonEmpty!13851 ((_ is ValueCellFull!3771) mapValue!13851)) b!359377))

(assert (= (and b!359375 ((_ is ValueCellFull!3771) mapDefault!13851)) b!359376))

(assert (= start!35776 b!359375))

(declare-fun m!356899 () Bool)

(assert (=> start!35776 m!356899))

(declare-fun m!356901 () Bool)

(assert (=> start!35776 m!356901))

(declare-fun m!356903 () Bool)

(assert (=> start!35776 m!356903))

(declare-fun m!356905 () Bool)

(assert (=> b!359373 m!356905))

(declare-fun m!356907 () Bool)

(assert (=> mapNonEmpty!13851 m!356907))

(declare-fun m!356909 () Bool)

(assert (=> b!359374 m!356909))

(check-sat tp_is_empty!8229 (not mapNonEmpty!13851) (not b!359373) (not start!35776) (not b!359374))
(check-sat)
