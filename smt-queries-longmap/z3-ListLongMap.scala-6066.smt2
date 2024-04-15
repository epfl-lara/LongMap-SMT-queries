; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78486 () Bool)

(assert start!78486)

(declare-fun b!914989 () Bool)

(declare-fun res!616992 () Bool)

(declare-fun e!513450 () Bool)

(assert (=> b!914989 (=> (not res!616992) (not e!513450))))

(declare-datatypes ((array!54445 0))(
  ( (array!54446 (arr!26168 (Array (_ BitVec 32) (_ BitVec 64))) (size!26629 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54445)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54445 (_ BitVec 32)) Bool)

(assert (=> b!914989 (= res!616992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!616994 () Bool)

(assert (=> start!78486 (=> (not res!616994) (not e!513450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78486 (= res!616994 (validMask!0 mask!1881))))

(assert (=> start!78486 e!513450))

(assert (=> start!78486 true))

(declare-datatypes ((V!30599 0))(
  ( (V!30600 (val!9663 Int)) )
))
(declare-datatypes ((ValueCell!9131 0))(
  ( (ValueCellFull!9131 (v!12180 V!30599)) (EmptyCell!9131) )
))
(declare-datatypes ((array!54447 0))(
  ( (array!54448 (arr!26169 (Array (_ BitVec 32) ValueCell!9131)) (size!26630 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54447)

(declare-fun e!513452 () Bool)

(declare-fun array_inv!20512 (array!54447) Bool)

(assert (=> start!78486 (and (array_inv!20512 _values!1231) e!513452)))

(declare-fun array_inv!20513 (array!54445) Bool)

(assert (=> start!78486 (array_inv!20513 _keys!1487)))

(declare-fun b!914990 () Bool)

(declare-fun e!513451 () Bool)

(declare-fun tp_is_empty!19225 () Bool)

(assert (=> b!914990 (= e!513451 tp_is_empty!19225)))

(declare-fun b!914991 () Bool)

(declare-fun e!513453 () Bool)

(assert (=> b!914991 (= e!513453 tp_is_empty!19225)))

(declare-fun mapIsEmpty!30594 () Bool)

(declare-fun mapRes!30594 () Bool)

(assert (=> mapIsEmpty!30594 mapRes!30594))

(declare-fun b!914992 () Bool)

(assert (=> b!914992 (= e!513452 (and e!513451 mapRes!30594))))

(declare-fun condMapEmpty!30594 () Bool)

(declare-fun mapDefault!30594 () ValueCell!9131)

(assert (=> b!914992 (= condMapEmpty!30594 (= (arr!26169 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9131)) mapDefault!30594)))))

(declare-fun mapNonEmpty!30594 () Bool)

(declare-fun tp!58662 () Bool)

(assert (=> mapNonEmpty!30594 (= mapRes!30594 (and tp!58662 e!513453))))

(declare-fun mapRest!30594 () (Array (_ BitVec 32) ValueCell!9131))

(declare-fun mapKey!30594 () (_ BitVec 32))

(declare-fun mapValue!30594 () ValueCell!9131)

(assert (=> mapNonEmpty!30594 (= (arr!26169 _values!1231) (store mapRest!30594 mapKey!30594 mapValue!30594))))

(declare-fun b!914993 () Bool)

(assert (=> b!914993 (= e!513450 false)))

(declare-fun lt!411401 () Bool)

(declare-datatypes ((List!18400 0))(
  ( (Nil!18397) (Cons!18396 (h!19542 (_ BitVec 64)) (t!26004 List!18400)) )
))
(declare-fun arrayNoDuplicates!0 (array!54445 (_ BitVec 32) List!18400) Bool)

(assert (=> b!914993 (= lt!411401 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18397))))

(declare-fun b!914994 () Bool)

(declare-fun res!616993 () Bool)

(assert (=> b!914994 (=> (not res!616993) (not e!513450))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!914994 (= res!616993 (and (= (size!26630 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26629 _keys!1487) (size!26630 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78486 res!616994) b!914994))

(assert (= (and b!914994 res!616993) b!914989))

(assert (= (and b!914989 res!616992) b!914993))

(assert (= (and b!914992 condMapEmpty!30594) mapIsEmpty!30594))

(assert (= (and b!914992 (not condMapEmpty!30594)) mapNonEmpty!30594))

(get-info :version)

(assert (= (and mapNonEmpty!30594 ((_ is ValueCellFull!9131) mapValue!30594)) b!914991))

(assert (= (and b!914992 ((_ is ValueCellFull!9131) mapDefault!30594)) b!914990))

(assert (= start!78486 b!914992))

(declare-fun m!848917 () Bool)

(assert (=> b!914989 m!848917))

(declare-fun m!848919 () Bool)

(assert (=> start!78486 m!848919))

(declare-fun m!848921 () Bool)

(assert (=> start!78486 m!848921))

(declare-fun m!848923 () Bool)

(assert (=> start!78486 m!848923))

(declare-fun m!848925 () Bool)

(assert (=> mapNonEmpty!30594 m!848925))

(declare-fun m!848927 () Bool)

(assert (=> b!914993 m!848927))

(check-sat tp_is_empty!19225 (not b!914993) (not mapNonEmpty!30594) (not start!78486) (not b!914989))
(check-sat)
